Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502B282F19;
	Thu, 30 Apr 2026 03:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519584; cv=none; b=sQXN2WIrQRXwZP9JgM7+X4ngogFojozDKouj0G7G6cuXtkmhq91g46UARIKrBEFzoyJnOksqonD+ZyLKXw6R599lokz3xj4I+/5XUzbGbfMOeUkyqKbpqdLqZ5rhnaX1QAuXcS881DXAilVbWSf1HNdraaKXUQMyAMNXpp0LDmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519584; c=relaxed/simple;
	bh=YLRZtfFNTmgVRKQzL/ebIB7raBLyFWP+zBt/tIh6/gE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rvcoAKKqqR0oCl7U22H9n+DxgKiSIXYOa1YjhhMYTDTA/2EFwdC3bqlLWNpHva+KbvpoIVck6lgCzjyzUETufoojuTPOt63XvY24HFOGKaAA6uABzKonl82dq/w85OwmyfYq/Yk39iWAU1QdUOwx3/ebp4I3mdigNbXWq7tKPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjAkF/lB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjAkF/lB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A6EC2BCB8;
	Thu, 30 Apr 2026 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519584;
	bh=YLRZtfFNTmgVRKQzL/ebIB7raBLyFWP+zBt/tIh6/gE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UjAkF/lBjBrztJbWPv7Nv+P1UQwRCadHgjZmyc0gOUgdshtZuG6fNVk/6qLysPWxN
	 cz3t4kVUzVaOpLfzu3/LvCeUqmfdQT6dbyfvFdGZNQHqe7dDD+3xhXDuPWm/HOBP21
	 VsujrCdKA7P5NzUJawotOUV3pfAKyP5Yrx/+iF+rLLBRmw14+ARbGsY7rcYMIaN7wf
	 gsJtpuEKSJ0kv4CkMyk1WFaP6qzknZqEk/n17a9tgeWy90WQ/ridNgrm3bd19S3mGg
	 5rq7JRJwBfVmOzhnSjH+krjZbWYqvNs94J4FiTD10T46AqKz3xXRixPmEAalrrEVRf
	 TM/g5vnXuYiJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E993809A07;
	Thu, 30 Apr 2026 03:25:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 07/18] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751953941.2274119.10364319398429839294.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:39 +0000
References: <20260227193030.272078-7-kas@kernel.org>
In-Reply-To: <20260227193030.272078-7-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:08 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,07/18] mm: Rework compound_head() for power-of-2 sizeof(struct page)
    https://git.kernel.org/riscv/c/8c846c879e22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


