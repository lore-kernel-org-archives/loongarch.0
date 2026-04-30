Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A46347FC4;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519605; cv=none; b=fnXtGg0bhUEJzEomS7OUQqwNgZw9zw6l87dbsfEqqyH8EeeLhc2FrAujIPb+GbVqUBQbR9Qz8ytWPcLUokst/BT4gv5C9N7S2QC5QogL5tDTtwYIKH2e9fF7tlcb9SB/UkPhH7nL15Kt8zAC1isxN91qTQo9jWpJSFW4J8sb8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519605; c=relaxed/simple;
	bh=fhSNmqrG5HsEC/X36MILLZcbTZ/au30iHuph+y5PVBY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=byFSM5PZpk54D3smUGF8/qWJ1MvEiPOTU/ko6WkxBkh6ETeQYW6onmuUwXZZMsMRD8bMYH6Z7S9oj+QRKm4isjBOnCFzqbmmHhLsWvoc1OGG/Ldp+RbMTjkRRqpToEnIf1dVWwFaWJ3feNp8eL7q8kCggXT6tcfoAIigvCXIkEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG/keSn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG/keSn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BC9C2BCC9;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519605;
	bh=fhSNmqrG5HsEC/X36MILLZcbTZ/au30iHuph+y5PVBY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NG/keSn0FdCovg8MaqpF8Evbj/6L9DumthcIlwwxhgqo4krFVNquz8+s6I6cAbdTk
	 F7gB7AFBovML2uNA08fug18O6ouheKOBf7t2Cnd7nzLWNimtDo+aiOW2df5uW2tRMT
	 rjTagxlakUXzJK5UOaOgiNsPLEmBzI0SrCWLU0VLJ0JlqZw+7s1UFWYN+UsHMoS2Qd
	 iECXbmORVBx8yix7TpNhGpQ4YIOkqqw/43+B09zOhAKOAI6t3lqj+2vCV+m4mWAT9q
	 7VgoHD8YmgUg9LVrLh8uiVHBbs9Yxff6nj7MkquNCz6a+id9IgGedB0JwH8SAImjFL
	 engiwcFkxaZoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E0C3809A07;
	Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 02/18] mm: Change the interface of prep_compound_tail()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956029.2274119.5996274092422873804.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:00 +0000
References: <20260227193030.272078-2-kas@kernel.org>
In-Reply-To: <20260227193030.272078-2-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:03 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Instead of passing down the head page and tail page index, pass the tail
> and head pages directly, as well as the order of the compound page.
> 
> This is a preparation for changing how the head position is encoded in
> the tail page.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,02/18] mm: Change the interface of prep_compound_tail()
    https://git.kernel.org/riscv/c/f0369fb13619

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


