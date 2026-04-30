Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD334D4CC;
	Thu, 30 Apr 2026 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519569; cv=none; b=iyThELC4aHRqtiWd+bHzbqSgfqAODfSONylAMd7VxNPl9CbsfsWYf4JCfWsJyJ/LRup7fljvfqcQ/qvwkjRhzCZOKl5s68GxdU1c+Sn/29DY+KQPXDIZF0FVdpbS2nGHdP6oG1lQ7IjV7uvGpPGjXAkt7Pl7K9cnProOl23Njho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519569; c=relaxed/simple;
	bh=Mv9m+6QFE5X2BSGU25QtTcnJE8P+nH7SNS4s/QHDQxg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UC8RnCo5ERYdU0tkQW/c/QHq2qKhEob4EeXR8i0xn7T1Zo8gY3NWCunYv7zXDYfNDEShq4bGKqp0F4UfO3WAj6kXYj3aNiudYjmGGVuG8BKoSmSXtPZ9FRZGHpMjHJZnKePH2fx92SLO2vY+daJetgagBQg4HjuaEVQSQtwJQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juZ89lUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juZ89lUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64A6C2BCC7;
	Thu, 30 Apr 2026 03:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519568;
	bh=Mv9m+6QFE5X2BSGU25QtTcnJE8P+nH7SNS4s/QHDQxg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=juZ89lUUjlVInyNLudhGL6gKUdYypOgVutLeQYu7+Zv9S1ojQMn1fsbg4/q8HA9kf
	 uytXyHEjScBl37xivNSPE4ryJhsH6K+fNiVEE3Tibqd01DfSHLLdV6DIGHiyfLM0j1
	 7lINbKqurIbK3kXn8ov3jBGtqjt9zr1HJOqGLUPQmNjzT4ay7v/AFZ6L1jO6UnQ4rh
	 0keCg/YHJh/PxXoT6xU3vqXVkdyYSyavz0pn2sGolZ+WXuho12ORsn1aVio9mo8Pvg
	 7/PlMZGkUL4uMfmMsq6/Hm8MqMlXxt9gGwLkoqjr+NZqDNUWGsEQTi8myDrLsVuFeA
	 HFH46Dai3te4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CFE3809A07;
	Thu, 30 Apr 2026 03:25:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 03/18] mm: Rename the 'compound_head' field in the
 'struct
 page' to 'compound_info'
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751952355.2274119.4433106526683678449.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:23 +0000
References: <20260227193030.272078-3-kas@kernel.org>
In-Reply-To: <20260227193030.272078-3-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:04 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The 'compound_head' field in the 'struct page' encodes whether the page
> is a tail and where to locate the head page. Bit 0 is set if the page is
> a tail, and the remaining bits in the field point to the head page.
> 
> As preparation for changing how the field encodes information about the
> head page, rename the field to 'compound_info'.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,03/18] mm: Rename the 'compound_head' field in the 'struct page' to 'compound_info'
    https://git.kernel.org/riscv/c/d50569612c29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


