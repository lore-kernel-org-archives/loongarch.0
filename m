Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AD1DDC33
	for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 00:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786668266; cv=none; b=hGNwd/kwD1MgCCwcAUF+uITTd6jc4q+LB5+PAjE7aATu+o0HrkxFzuFpEyTkjAFtWin6FL6qSr+JdGiArOSJdw2cppn9ifryRnvn0FH1tOV15D61sHYU6oJ6FPOlWIfZKJtgcSMIcFfaDKZSEAsSkGo6tG2P/CkWP7IjUOHsOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786668266; c=relaxed/simple;
	bh=hwrqTBWRCml9zB/KmV2llNF5eFqsQ+Kriy/bwgsfnDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKlQc7aMwGW2CLO42pN/rIIRqBMSgBZWRhULHlR+hZhjKBUyCd7O74ScoVMKNmRaA5Cy4lKwytO8XnGUVHWDR9UD8PasRdFmJQY7uvmO9SZFM1A8OAW1TI06a1hUe1RKFBgOPHu0Fri+/5z2mQtBWuN7F6irg+csy9+52SlvHvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iEZdEtHw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iEZdEtHw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D649140E019C;
	Fri, 14 Aug 2026 00:44:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rPnkIJ1fR_zo; Fri, 14 Aug 2026 00:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786668251; bh=SV6AhifRpNxO3jjztVsuuJVj/+NzYY34wziugDkFZP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEZdEtHwFul40IDazRCokmJSFtqJZ+0aMIZskKfqvEk5Ch+RhfRTiyxunvaPmhDQw
	 kyWWJeb1BhxvMiC9G8Q5NdjvrsM+vWJB5F1NIQAEY3T0nmpAzciEWXlmuxzgmutkav
	 1RLowVFnhDE1Jg4CX0a1fSobo2qxuoR/UkdCAJjYq4hw/JLn5xC8oRepqAr7IFcX53
	 OEFAXZEtWnV4KA2zu7T6m32wsBwznDc82HDkWYNP4MXwqU8ee4BvXPJJtgZBn/92Ma
	 RjGcgD/zc+vMYXb8Z3E31VnF83H18WpBLlZGL6l2JY0M2g6dYTBa+wTn7mY55zq3/p
	 lYBOvr5lXCcl0FsK7GfBqPHEsODnCl3Bo7DC8VQV0lXFim198fcXOHCT69Lf2NKbDH
	 CQlxZHJlhRxX/ILedbPSTY35EqoRa8j6n+k0+3Hzue12ncKgjVYPdc1S4hN2JpHGDr
	 1pvYP/rLidUS2zweSZzNL/mhMmTAOft/EZyScShb0vDlThmS4K5tlDruU4/e8JWt8M
	 LqO1xaSbHSgcyGuKsV1UlkFjSR92/UpC59tQ9fDv5A7t8MopnNEI5x8aRearw4yY9J
	 CTQP601yG3NP/q3QE6D4gnBvc74x3Nb2pKv0GiguNttoUlxZzWv+HUPoTiRzu0Fc/7
	 nHIhwc5KayYZ7Hf3UQwtwP1c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2F67040E0031;
	Fri, 14 Aug 2026 00:44:05 +0000 (UTC)
Date: Thu, 13 Aug 2026 17:44:02 -0700
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	chenhuacai@kernel.org
Subject: Re: [PATCH v3 0/3] EDAC/loongson: Improvements for Loongson EDAC
 driver
Message-ID: <20260814004402.GAan5k0g6WnRhL1zpj@fat_crate.local>
References: <20260812064139.1231-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812064139.1231-1-zhaoqunqin@loongson.cn>

On Wed, Aug 12, 2026 at 02:41:36PM +0800, Qunqin Zhao wrote:
> This series contains three patches for the Loongson EDAC driver:
> 
> Patch 1: Encode node and MC info into mc_idx so that on multi-node
> systems, sysfs entries uniquely identify each controller.
> 
> Patch 2: Get DIMM size from ACPI _DSM method instead of using hardcoded
> values, enabling correct display of memory size in sysfs.
> 
> Patch 3: Add CS4-7 timeout filter for cross-node access on 3C6000
> multi-node systems to prevent false CE error reports.
> 
> Changes in v3:

Sashiko has comments:

https://sashiko.dev/#/patchset/20260812064139.1231-1-zhaoqunqin%40loongson.cn

Please address them: if valid, fix them, if not, explain why they don't need
to be fixed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
