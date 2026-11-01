Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571364;
	b=iTY7kEVQjhxhzFcaC8VkzA5ZusrLEZD+wpSYPhoWqwOYvI9anMegvw/BV28SHdIzfV0P
	 Yxol3v27zy8OjBNViXMpthCMRnMQ2irkerLn2LRXXIGZKpN2JofeyiJVcFb/aVM0+3cKz
	 /64DDsjklPG6Blv/SmFPR1iad4FGltrtJqKaP+gB7eoRMPXA+VO7wnOGf3wInmdQ6ZYRK
	 3glG2YVjJlYQzb4iI452q43PvMoxYUl1QHGtotjrDbTlqlz59XzCKCBaQaYpdFiVAVsuV
	 nfNAciKBPOWdK6b05LWhg/a04ikBFOYxEXZJaKc1so6udjzMi5DSpz3N4S20OZeO2/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571364;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=1QVLcxKIGpBrR1ls29kmgMJV8dBu1FUp9t501+9SlJY=;
	b=uhZfsn5Y3WUAtRhL5P6xBWO/JxmEu0kmlB9FoG1ERtKiXSCI7du58vm11o7EVAPWp+Zh
	 JrLKNqK8zdfCe3x4kfGVr784rSs8G/+0DJ3QkJFmthv3nPCFNTOoQm75qEqxdHGoDsOJf
	 pkcGj6XjBBWlnXbdcAQiowLaT20k0tQEgjIzivSAH1211y6FloOtvfVEuZgflfmAxWv4c
	 VZL/XfJOhViFJX7rNekqQSwFHq+w4lxkMR/Hv9D6sdmu2X+yKR/C6OEvh4cZOAd9Q6vnD
	 BNFEQao4yBOzkL8YaNi2nm3/kN6E/GDpD6cskr4niQl2VQZjODwsjlnHTTVdb+gNG8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkhr+eF3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBC606A32E;
	Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkhr+eF3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887CB1F00A2C;
	Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571363;
	bh=1QVLcxKIGpBrR1ls29kmgMJV8dBu1FUp9t501+9SlJY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dkhr+eF3q1vLH5j+Vt4HH9N1vxJVl63OY3ZWjO6x3dSLn6eQyYKacs6+oM+3Qn+lI
	 thS97Vkt+DR9px4LyR/SisaZrzLD9G4XkXITq3BcSDr6ocIppa7a8idnye+qEIqM/4
	 lA297xuw1etIPcz1D0z9fjeTfmdqf6SQPW4T9L8XHNuLzhxg5drxCmE0d9RsQKGE7f
	 z+lpwxPVzUbcNwvBGGrQmdsobEkchSaH6YXFrcneezcbTudB2i/2DWGMJc6AtOWD6C
	 C8++koYKIE/Rb+G/udcYaxQ5Bv2MDWCQ3FwdoYvX/c9BzD2IHxxqLnrHL9kBU1vqtn
	 vMh0jbZFxh6bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D35B38003B8;
	Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357136205.2624073.6611857519856364383.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:02 +0000
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, luto@kernel.org,
 bp@alien8.de, jackmanb@google.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, david@kernel.org, chenhuacai@kernel.org,
 mingo@kernel.org, mingo@redhat.com, kevin.brodsky@arm.com,
 liam@infradead.org, ljs@kernel.org, mhocko@suse.com, palmer@dabbelt.com,
 pjw@kernel.org, peterz@infradead.org, hpa@zytor.com, surenb@google.com,
 tglx@kernel.org, vbabka@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org, dave.hansen@intel.com,
 jgross@suse.com

Hello:

This series was applied to riscv/linux.git (fixes)
by Dave Hansen <dave.hansen@linux.intel.com>:

On Tue, 21 Jul 2026 19:23:23 +0300 you wrote:
> Currently there are 6 independent implementations for set_memory and
> set_direct_map APIs.
> 
> With increasing demand for kernel page table manipulations, for example
> "Direct Map Removal Support for guest_memfd" [1] and "mm: ASI direct map
> management" [2], it makes sense to have a generic core for kernel page
> table manipulation in mm/ with helpers in the architecture specific
> code.
> 
> [...]

Here is the summary with links:
  - [RFC,01/18] x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()
    (no matching commit)
  - [RFC,02/18] x86/mm/pat: fix effective RW computation in lookup_address_in_pgd_attr()
    https://git.kernel.org/riscv/c/ebaf7c9bbb1e
  - [RFC,03/18] x86/mm/pat: replace x86-speficic pg_level with generic pgtable_level
    (no matching commit)
  - [RFC,04/18] x86/mm/pat: use page table accessors for effective RW/NX bits
    (no matching commit)
  - [RFC,05/18] x86/mm/pat: use a generic helper for the large page size
    (no matching commit)
  - [RFC,06/18] x86/mm/pat: introduce an inline helper to check if alias needs update
    (no matching commit)
  - [RFC,07/18] x86/mm/pat: introduce cpa_handle_large_page()
    (no matching commit)
  - [RFC,08/18] x86/mm/pat: use cpa_split_data structure to pass split parameters
    (no matching commit)
  - [RFC,09/18] x86/mm/pat: use a single locked lookup for PTE verification
    (no matching commit)
  - [RFC,10/18] x86/mm/pat: move the large page size calculation to should_split_large_page
    (no matching commit)
  - [RFC,11/18] x86/mm/pat, mm: set_memory: pull change_page_attr() core to mm/
    (no matching commit)
  - [RFC,12/18] x86/pat/mm, mm/set_memory: abstract the CPA page table lock
    (no matching commit)
  - [RFC,13/18] mm/set_memory: read page table entries with pXdp_get()
    (no matching commit)
  - [RFC,14/18] x86/mm/pat, mm: move cpa-test to mm
    (no matching commit)
  - [RFC,15/18] riscv: convert set_memory to the generic CPA implementation
    (no matching commit)
  - [RFC,16/18] riscv: make set_direct_map_*_noflush actually noflush
    (no matching commit)
  - [RFC,17/18] loongarch: convert set_memory to the generic CPA implementation
    (no matching commit)
  - [RFC,18/18] loongarch: make set_direct_map_*_noflush actually noflush
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


