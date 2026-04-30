Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BA8388E70;
	Thu, 30 Apr 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519594; cv=none; b=exWTL26IzvbUe1ffrHy+JfMPTCWkU4vhH3sBVC/q1S2vr1hcP4css1N2HTqfSd7Dh0dUlVWnQAOxuSZWlBdIrCLEdZgOCxRqzQbrbOIE3eEoigpC/JD4JN1ZytFh+vduQUBJ1ewHYbnu+h7TL3q99JBjR1YTn4eq0mlnaQzpqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519594; c=relaxed/simple;
	bh=NX3tUbayE/lMyAJb6o3+e820TWiqNMgOixMjRLbyqAw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LABXAxhHV0WKcRE6eg7wVlWTtA+ccOUlgtpUNueWinkON1VBGVioa9kNZqc+JqmHWDA8QXY0yOAmeuo526foxfYP9ozlp3rYJSuz3tVOcOp74WkZTJ4RGBqB6nx7SRLDIvbpkaWKdqY3GC9bcalN+Zfnkn3y0Vr03MHP4gQ6FoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP65EIKs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP65EIKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76E4C2BCB9;
	Thu, 30 Apr 2026 03:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519593;
	bh=NX3tUbayE/lMyAJb6o3+e820TWiqNMgOixMjRLbyqAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mP65EIKsJxlWVdg+ZdXsnteOQuTT9vum2+qioBLuE0frnQQRT+QScmlJYMF4r2rSI
	 vRnOVIKGyMypZxqAJx34gvszIqHVXmR+QkkjPihM/bdH5nsCqw/IomU2lfLTIO3qaV
	 fvUnaxQNW+/G2HtGg5iLLamjVYA7JPeh8wZvmVHDfu5iMSPTt1nLar5p0412CtWDgK
	 lyGF9LgaCB6elDJvdu74+k3vsoWGMlR2V3nAuZBmKoikIMpqHRujdbYpu6ZuyNybOl
	 b62emfrFlXYc+v3w4ssHP5Gk2/SwOXz6mEx13YBbE2tukLYy+rUTQphw0/yGbP59MZ
	 ojfVmdQYoJ7+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD903809A07;
	Thu, 30 Apr 2026 03:25:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 01/18] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751954879.2274119.13489551409469223831.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:48 +0000
References: <20260227193030.272078-1-kas@kernel.org>
In-Reply-To: <20260227193030.272078-1-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:02 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> 
> This is preparation for adding the vmemmap_tails array to struct
> zone, which requires MAX_FOLIO_ORDER to be available in mmzone.h.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,01/18] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
    https://git.kernel.org/riscv/c/a2c77ec320a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


