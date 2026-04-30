Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EB396B79;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519602; cv=none; b=mUh/Rixl8ARBMRLx1sUw+PvH4NgNv3io8KXWJScg0jgMPScPyZU6qxPo9CkLVPgt0625TTjlrEpmfLbVHMAcNyfoFGeYTWQQ7+gkXxV6C+9GSf7YmRNT57OVZZvBGrPY58Q1eiW4VS/HdeIxLNVKVDPjZKKAdL4m1we6s3hJYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519602; c=relaxed/simple;
	bh=jOQ6F/qbqPQvr86AWUfO60sG0ahit7mDPYuhhIPcxY8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fO96PuIrPmCyqHV/RKl/7F91K88YTtSu8m1kCiaj6QFIbjwNzSan2RKGNwKmu4vU3ilNAi/cJzCdiOu/+u2v+uaUbEtTqvXzTaYbVq0ushLoLmMFLOXoTh9uZe6/2lUZY6p836aX49satWx2EiJshjakAdQwQB+X6DSsNPgJ0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeR+2fmK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeR+2fmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0920CC2BCC4;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519602;
	bh=jOQ6F/qbqPQvr86AWUfO60sG0ahit7mDPYuhhIPcxY8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EeR+2fmKlkkC3zXJwh38hlAoE2ur0kbazDdCl1B0MzT/OzLC7NC+ZFsu3TPGh+796
	 1/Fwn9HhrPzwpstx5GId8w3mBHNX+inZaFjWNZCcKAt3Hx5c7c9X6uhDHJ7nHFEuTH
	 Mr3HXQraGn7ohoz860VHeqXMnOfcBHYMb4T4DMOb4BFIN5FcUNgi39M2UCuTGwL7hT
	 In6FDxyUbEFipwzNGL+OYqMERE9GjsYnTUp2l1+SjCm14W/kgT4XbCAnl39BDschFA
	 SmzEX01qhFEt2udL9WTiIjiVW38Jch76j0dr7SJpWdZA6RjuNd5fQQuQw3af4SB2gc
	 gWvic7yeoMu2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD553809A07;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 08/18] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751955604.2274119.1021480725497900179.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:56 +0000
References: <20260227193030.272078-8-kas@kernel.org>
In-Reply-To: <20260227193030.272078-8-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:09 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> If page->compound_info encodes a mask, it is expected that vmemmap to be
> naturally aligned to the maximum folio size.
> 
> Add a VM_WARN_ON_ONCE() to check the alignment.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
    https://git.kernel.org/riscv/c/9f94db4c7eaa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


