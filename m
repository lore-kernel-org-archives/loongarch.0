Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D36383C74;
	Thu, 30 Apr 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519586; cv=none; b=sVdiSA5SMS15tpGEbvS3hTuMkwPYoOjaGZ2q74dCN0sD3sWkBJ12YgsMKaRX8WF42t58Sb67b9Q819eOO4XlkkPkcizE7JkftLVbTM7n+baRdPoZjM+jQ3FVDw9soF0rUXlQV3biGJcV2J5vEncMHY6lsgy19Yu/D2uO+/e9MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519586; c=relaxed/simple;
	bh=7NsYW91aqne8euCtRV/Zaf8K1DQN8v/p5dHajdo+8yc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jIDMl5/j4uHgBWRaRZmVur8CZXX0WJtCCtSp5rB/AnaQty61hqRQjPnEoU/hkCNFxCHMnGpnYGcgE84G/H+A5zjugxHLls7erJPx02MdPe4wn3027TY7wvJ15f2rk2r+BdhR0WSZQL3nnbGhqgak1Wjj2ePkN/fLy0Gm9wna+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDggSUI/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDggSUI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9403C2BCB8;
	Thu, 30 Apr 2026 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519586;
	bh=7NsYW91aqne8euCtRV/Zaf8K1DQN8v/p5dHajdo+8yc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BDggSUI/DU00ul+f1gXDXnnF9GW7Ln4bEPIleiGatyjAcEDR3/0c3HZ45qeuP53O+
	 RHqUBUleYalpg/t7kM2RRrOc7opPlWUoW4RC7GR5y3Bs0jP+staKlwJZvt8AY4Vght
	 GW5FNvgEwFUCcJDe8gKUKchXT0d4R9CHF5faG0OmsqjTk7ZMlgaNiCobP6ZJa8bHjV
	 843djgTadQOXBoY1gLWaFLk3iH4N4aTsoXVrb85auq+UuOKSwFnXafOsRXr416j9cA
	 Mt9x87MJjmjRNDYbbOA3t6kXEA8gYvQZOIzytzDlqzDkDODp/PFewOmUK5nEEmUChG
	 6H7uKZd5Pu/eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD063809A07;
	Thu, 30 Apr 2026 03:25:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 11/18] x86/vdso: Undefine
 CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751954081.2274119.4093898849560517911.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:40 +0000
References: <20260227193030.272078-11-kas@kernel.org>
In-Reply-To: <20260227193030.272078-11-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:12 +0000 you wrote:
> The 32-bit VDSO build on x86_64 uses fake_32bit_build.h to undefine
> various kernel configuration options that are not suitable for the
> VDSO context or may cause build issues when including kernel headers.
> 
> Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP in fake_32bit_build.h to
> prepare for change in  HugeTLB Vmemmap Optimization.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,11/18] x86/vdso: Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
    https://git.kernel.org/riscv/c/76351f2f0c27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


