Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3186374728;
	Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519565; cv=none; b=VcJT5AZ13uCUSo+kp2s+BHWzXr75kIezg2M6GOVoyx8cZJgte4lH+Phr8cCmNzM7+FbkO8lqwub+v/QHE6iw8WrBktAEJ6cp9MHXteSl5tcW/Zo8dfs3XI26KGisUSzO3LjcOltODsL7lQ1W+nqDqCOqVxccifQfdhof9jlhr8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519565; c=relaxed/simple;
	bh=u3YoJI6PJeGWY/+fiJtWlQKeltd3H2IlxE1eW7TcW1A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=swwa8ZqNZ77BpHOOac+ilwK+8xVPkmk+1h/BPr9q39ZV/0Tnxiayja1JEtQiwmrmOl4p2ttjX63W+eDCUQd1vWQr+usgJoOLGtOFxtKvbbHw4rzdgzqeE7Vn6UjVYwBKrZ8tsT3CSAmRUDjhZcMEFM/RiiKQmpEF54XFsc0AClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVM+pktx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVM+pktx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7875C2BCC4;
	Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519564;
	bh=u3YoJI6PJeGWY/+fiJtWlQKeltd3H2IlxE1eW7TcW1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fVM+pktx3qjd5wzp95nMpat78U+9GCLO9zfS0yJaFVt7LtrOzHwjQl5XYjgchazAi
	 GzBT3q0NikQODltSrtECYbwuUtcf5M44X/Khc8VQHfC4kybRnJ1RLFmzq8TS24PfAR
	 DTB83zl0VVO3hZ77nLDO3pxYU3IEFyM8xscIKtHOY4wmR/fE7dWT+mucmp8DqFeqYy
	 zvpMTvGyKhHJqASghT9ckCceQKLSZtOW1vVXXjjPZSLK/8jUTGtyLepmQTw/JwD2xU
	 viwJNWXaDMxcGK9hmTQbpKeZHcvviMpDn9u441MGWrPaIERXtZavQRgOd1S2RKPAaf
	 7R0DVkVfCocLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DAD3809A07;
	Thu, 30 Apr 2026 03:25:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 04/18] mm: Move set/clear_compound_head() next to
 compound_head()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751951954.2274119.3235115726287439195.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:19 +0000
References: <20260227193030.272078-4-kas@kernel.org>
In-Reply-To: <20260227193030.272078-4-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, david@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:05 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Move set_compound_head() and clear_compound_head() to be adjacent to the
> compound_head() function in page-flags.h.
> 
> These functions encode and decode the same compound_info field, so
> keeping them together makes it easier to verify their logic is
> consistent, especially when the encoding changes.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,04/18] mm: Move set/clear_compound_head() next to compound_head()
    https://git.kernel.org/riscv/c/67c79a5af051

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


