Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B590345740;
	Thu, 30 Apr 2026 03:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519587; cv=none; b=t/WMyQE5VPCeMuo0Jb84zGbXi+jOaogXoWGj/HWY3cRt+Sd3nG1sLN/uqbnWqRI+efifl8XnV3byRKUCdG8ZOGRBwwjfHLEQQGeL6JbTr/AUfF6HJsR+63zL/AM8Mpw00lar1DTW22dtXRAMQp4uFm5hz4GiMxcIXNR5pPgM+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519587; c=relaxed/simple;
	bh=013+JQB3BOWcgJhPqdubZ1XsxYbnthONCnm8Hl39HsQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AtIR01ggWfmhbhMM1Ysv61k99HghyFPqLwYfxtdWkD96v7Iqtecakvz1uVDwuRYYstUElvziDRlHdNRR012cseqV9UxWgZASx2u6zINGzyiWiUtyBJVrXrrwlZM7y8Z/NXHkYyJc5gs7YZilTIUeVyNmN+SLdQsC5RciBSTKmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJ6OmXOM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJ6OmXOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68048C2BCB9;
	Thu, 30 Apr 2026 03:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519587;
	bh=013+JQB3BOWcgJhPqdubZ1XsxYbnthONCnm8Hl39HsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZJ6OmXOMpE+dTJPzp+xtAqL+VAk4ePieug406a8qk2/dHpymUK1JjCTkKOHPysOIj
	 INPaAGoTWRR3yYCB5hELjnfdvAfGK4/sGDb+7eKy4KcyPn66lNIN1AaypMkVLUWRno
	 7mvTCzzvR+eFzmFD0As9ZNiX2e/asCEu9Bt/Ir1neq8SH3sHmTB1VpBR5W91Ed2cp8
	 vwrXvOOhet4pbTRNVpG8lw5+rnuaKpNo6/Hy8IdkRQBmQg6ZuAtLQfTaHppkkwkHi8
	 +xwHkUQkz6fLJPc01QgnX70Wy4T0kzoqFakSpqhh5J9lYDGXyJBUznVtbJbQXiu6wY
	 hb5+2ZtbiY3QA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F543809A07;
	Thu, 30 Apr 2026 03:25:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 06/18] LoongArch/mm: Align vmemmap to maximal folio size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751954230.2274119.12654930976338727655.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:42 +0000
References: <20260227193030.272078-6-kas@kernel.org>
In-Reply-To: <20260227193030.272078-6-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:07 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> struct pages of the head page to be naturally aligned with regard to the
> folio size.
> 
> Align vmemmap to MAX_FOLIO_VMEMMAP_ALIGN.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,06/18] LoongArch/mm: Align vmemmap to maximal folio size
    https://git.kernel.org/riscv/c/2969b42c8f99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


