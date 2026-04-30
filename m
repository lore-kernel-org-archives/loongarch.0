Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501535B64B;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519557; cv=none; b=A+lom9SgvoC5ZutrwzL9Cb/YD/v6g8lpWMKOWJQqz3FRZAdvndnLaRS4gciOqVFnkAL44fesL6rEq2NwB/vwqx0bK72aP7AZnnUGJW0xynaG8GU8i6pfXFN0SFQ1BGH/xDa4R9lPkPMH/2LWMvcrNo7LzynjJMgKDAK319SwdRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519557; c=relaxed/simple;
	bh=3A9sSPpTFnTSwNLnH2RiVekzHJbPnUK+mXyDzY4bjyk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hF4DQanB7nDIEnHKKWDnEcpT+BENzAjwoqCaVd1mQ0xaGdYKylFl+e73pRv07/uykrx+Iqk1nvHsAmen6d0vgyX/t5CsMVSdHWTvxGr3pfrjkym2h0s7USs5zHr3h+rdUVJ+a6ewTVhC1onsmnhQS9vcqxPteOcC8v1Zf82vAhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvM8my1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvM8my1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662B9C2BCB8;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519557;
	bh=3A9sSPpTFnTSwNLnH2RiVekzHJbPnUK+mXyDzY4bjyk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PvM8my1IW2Yjwupoq66vKLJIr1YZ/KioPkhJQkE7eo14dAk8o2H6RNfUatGZ2Au9S
	 91HQM/8YvYPRiw98kHgqVpZmSf7VnKX3GtzG7tbbozHcDgaRlvxBU0lZAMm+aj7cPh
	 qT6q1tde0FqSYSPt0N2fidtUIF1aUhoMl4reQhuruOMGgj3cRRvZeoBRiI4AEgorg0
	 StaKda1S6UYGl5kKlqXb2yBN8WQ8cq7wMowo/Uy/ler0ew/dVewdsp0hCgMvA54aza
	 CunUoeLgN5/VA34GkpqJiUE2zYwO5PBQl4g1nYfrAsGa+cekkOMHiB31Rm0HDxSQeo
	 il5OF8PZWn6WQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA3583809A07;
	Thu, 30 Apr 2026 03:25:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 16/18] mm: Remove the branch from compound_head()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751951229.2274119.12563342067361093997.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:12 +0000
References: <20260227193030.272078-16-kas@kernel.org>
In-Reply-To: <20260227193030.272078-16-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:17 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The compound_head() function is a hot path. For example, the zap path
> calls it for every leaf page table entry.
> 
> Rewrite the helper function in a branchless manner to eliminate the risk
> of CPU branch misprediction.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,16/18] mm: Remove the branch from compound_head()
    https://git.kernel.org/riscv/c/66b2a3d9ae46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


