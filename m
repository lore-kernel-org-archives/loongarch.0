Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470461AF0AE
	for <loongarch@lists.linux.dev>; Wed,  7 May 2025 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612541; cv=none; b=VnzFsx2kXvMyvyhInZWxdHMY6vUcKie2E1c1IqvzwKQ42orgb8WBLBCYwTofpyMnyy661RpVji26MsJjck4y5w3OZTlLa4h+WQ56+gXWtl6yKseqz5rOrKM5lCoEjBSWPk/cc4n8eN2XCZiJS1rKtbVwWAlZ7aMULWT6nkGOvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612541; c=relaxed/simple;
	bh=n6lCw1sy+ORvSo4bCuquNbCP1w/NFXIXgJE2ssF21RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eCoNSqe85rNRNvvtJbFTF0IBpbEGn3AHEjQZ7J8U2yPd9cEclAlfCcen85C0GUTqOtDqTbkn+zjjZwjx2HcntVqqQE6TaDZ5xqdJfNQam4OfmVhyRhV+JLkwV2x/AOFxtXh6E8N7JZ2+OprabSjBmQf5sMEjj6Sm5vQwwjTtaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SvM5WGcu; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SvM5WGcu"
Message-ID: <d0575ec1-1901-4534-875c-fa9375e54e3d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746612537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iauQdHWNLGQR4lEBlGfPU1DZ2z64r7U0kJb+L52u76c=;
	b=SvM5WGcuwP2+z8BxEC6+TLSd66DP442/+bmUDxuzi9mnA3AvK0qY1j9evy2xNLKueMZYQq
	kOWanddwuJJWC58Li8dmADN3Xy0GUsrBKYLfKRn2n04A5AyS4G4LCKxziAiWwJiDqztU26
	kA6tY7ChkXaNMTbvHZJ+mF+JLR5S3zw=
Date: Wed, 7 May 2025 18:08:48 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Initial support for CTCISZ Ninenine Pi
To: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250501044239.9404-2-ziyao@disroot.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250501044239.9404-2-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/1/25 12:42 PM, Yao Zi 写道:
> This series adds support for CTCISZ Ninenine Pi, which ships an Loongson
> 2K0300 SoC and various peripherals. The vendor prefix and the board are
> documented and basic SoC/board devicetrees are added.
> 
> I've successfully booted into console with vendor U-Boot, a bootlog
> could be obtained here[1]. DTB and initramfs must be built into the
> kernel as the vendor bootloader cannot pass them and upstream U-Boot
> support for LoongArch is still WIP.
> 
> Thanks for your time and review.
> 
> [1]: https://gist.github.com/ziyao233/7fd2c8b3b51ef9b30fe5c17faae1bc4e
> 
> Yao Zi (4):
>    dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
>    dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
>    LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
>    LoongArch: dts: Add initial devicetree for CTCISZ Ninenine Pi
> 
>   .../bindings/loongarch/loongson.yaml          |   5 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/loongarch/boot/dts/Makefile              |   1 +
>   arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 197 ++++++++++++++++++
>   .../boot/dts/ls2k0300-ctcisz-nineninepi.dts   |  41 ++++
>   5 files changed, 246 insertions(+)
>   create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
>   create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts

For all the patch sets:

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,
Yanteng
> 

