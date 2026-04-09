Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B2A348453
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748612; cv=pass; b=WKXJB5Az2GDGODex4Ur4mEVDfCQi8sF7DARQdeiyKGOUAf6s1/uRnHirLhRFzcEjYMleAxMwlyTkALXXTo2cf7ffzkc7n+CmbUle05mu5rxafLS3J0sX+1DxL+WRgY6L+v4+22U7mXxttyxD+JijJzKuW69GGaxEx4eVRJ7So8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748612; c=relaxed/simple;
	bh=wKginzGFYQPFTtlx1CLpJLs55vMmg7QEbB/XjbKRUYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHslU2RxZ/qvN6y4aIRbSUF4mQimob6T5ZRbhfaXXjyjC8LLFkuf4+laGBC+TvIKVuCkZ48nhQyH3rJSXPKda+enby3gfQcolo9jPRf3dnmh9e8kufYJ3Ux9Hk7Mno0Ex8ufCsWumBIHKcei/e/wCDYXhnEY0pWah1fXLoFg55E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=JWm8pXqT; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="JWm8pXqT"
ARC-Seal: i=1; a=rsa-sha256; t=1775748597; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KvYYKnZ4sWid9eJd6a4NadjFH2Yers/pfsaDopCmFWcoGi6m864hqPIMjCJBb0F+QDu6NlrqDKrhtXGQyeBYRbWr2XyYk0f2/KnwhKPjbLE6BfdTZt8cHC3XrKBn5k2HAZzf7dv/IYHiEQ6i0Dl+jFw7EuURShwWfGEQFbvneC4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775748597; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCya6/6p3ziVwMnzXoPmALEmoD5fx0FpV857lpJXWNs=; 
	b=bozhboJIxIHkg35R1iNwS6wjvgAMqwHYow3vDKGjL7qHhvNW6LFWxnTKPKhfkK9sF5R5r+MO4EryTtCDTacrF7S+3DPgbZs2ELUwBaV0tspRhkrZ8eMl2xyxJ76xb2LVCfrSsviNEvkhSNFp6I5EMD0cDwfBLiCyj1a1287jnyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775748597;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=XCya6/6p3ziVwMnzXoPmALEmoD5fx0FpV857lpJXWNs=;
	b=JWm8pXqTnBaB57137gws6Fr3UOvlD+NbKU6bWzwpad5lAe/5HYaj8cNTfH2qCuVM
	SfUSGUglFXECKhZgfgbB2256R5VgxaRCrfmJcI3TyhqJOOLDSEofni0yeARI02adMNr
	MYLMlYU76/XiCbpA81NvaKv3dOFj9vkkF2w/Xp4c=
Received: by mx.zohomail.com with SMTPS id 1775748595549628.0734936657127;
	Thu, 9 Apr 2026 08:29:55 -0700 (PDT)
Date: Thu, 9 Apr 2026 15:29:39 +0000
From: Yao Zi <me@ziyao.cc>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: ls2x-i2c: Add clock- related
 properties
Message-ID: <adfF4y8_GhtExZMf@pie>
References: <20260325-outstanding-weasel-of-fruition-89db37@quoll>
 <1b5283d8-294c-86de-c3d8-bf205ac24216@loongson.cn>
 <0d7dfe5b-5e2d-4850-8922-16eb6bd9bcae@kernel.org>
 <900dc1a4-66ab-411f-8a32-4c6cf339e8ec@kernel.org>
 <bc22bad4-9825-829d-1df0-a801ebd933d6@loongson.cn>
 <ca984be0-e7a6-4897-bf9f-db9465942c6e@kernel.org>
 <ac62e280-1099-c0bc-f322-ba8b65307053@loongson.cn>
 <2388acbc-a927-4727-a23c-5ecd7c33a926@kernel.org>
 <a08ac3f9-a770-df48-a95b-4b07cd2c0d58@loongson.cn>
 <e10017ce-cda0-5b5e-8cd8-3488aef4cdb0@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e10017ce-cda0-5b5e-8cd8-3488aef4cdb0@loongson.cn>
X-ZohoMailClient: External

On Thu, Apr 09, 2026 at 08:03:47PM +0800, Hongliang Wang wrote:
> Hi, Krzysztof
> 
> On 2026/3/31 下午3:11, Hongliang Wang wrote:
> > 
> > On 2026/3/30 下午3:23, Krzysztof Kozlowski wrote:
> > > On 30/03/2026 09:18, Hongliang Wang wrote:
> > > > On 2026/3/27 下午2:39, Krzysztof Kozlowski wrote:
> > > > > On 27/03/2026 04:09, Hongliang Wang wrote:
> > > > > > The initial idea was that this patch could be used for
> > > > > > both ACPI and DTS.
> > > > > > > > > The i2c-ls2x driver is compatible with both Loongson 2K and 3A+7A
> > > > > > > > > platform, parse
> > > > > > > > > the same parameters regardless of dts or
> > > > > > > > > acpi parameter passing, So
> > > > > > > > > clock-input
> > > > > > > > > and clock-div attributes are defined to
> > > > > > > > > describe input clock of i2c
> > > > > > > > > controller and
> > > > > > > > > divisor of input clock. It can be used on
> > > > > > > > > both 2K and 3A+7A platform.
> > > > > > > > And you cannot use them in DTS.
> > > > > > OK
> > > > > > > I need to keep guessing what you want to achieve,
> > > > > > > because neither your
> > > > > > > message nor commit text was explicit
> > > > > > What I want to achieve is to describe the input clock
> > > > > > and divisor of I2C
> > > > > > controller
> > > > > Input clocks are defined as clock inputs obviously in DT, not as
> > > > > integers. Bindings need to describe the hardware, so start with that.
> > > > I can describe the hardware in loongson,ls2x-i2c.yaml, and I
> > > > would like to
> > > > confirm with you what final implementation plan you agree to? clock
> > > > framework
> > > > or custom clock-input an clock-div attributes? if clock framework, how
> > > > can it
> > > > also be used for ACPI?
> > > And you ask DT maintainer for that? It's not relevant. You sent DT
> > > bindings patch, so this patch must be correct and we discuss this patch
> > > here.
> > I don't. My idea is that if the clock input attribute can't be used for
> > both
> > dts and acpi, then clock framework will be used for dts and new define
> > attribute
> > will be used for acpi. I will first implement the hardware description
> > and clock
> > framework in Bindings.
> > > Best regards,
> > > Krzysztof
> > 
> > Best regards,
> > Hongliang Wang
> > 
> 
> I have a question, the input clock of i2c controller can be described by
> "clocks",
> but there is no existing attribute can describe the divisor of the input
> clock,

From the description of 7A1000's user manual (section 2.3
"时钟功能描述"), it seems the divider isn't part of the I2C controller,
but instead is an on-chip divider with fixed 1/2 factor, feeding both
"MISC" block (including I2C) and SPI.

> Can I define a new attribute named "clock-div" to describe it in DT
> bindings?
> or do you have any standard solutions for the divisor problem? Thank you.

If these devicetree-based Loongson platforms follow a similar pattern as
the bridge chip, then the divisor shouldn't be described in the I2C
controller node. You may want to include a "fixed-factor-clock" node to
match the hardware.

> Best regards,
> Hongliang Wang
> 
> 
> 

Regards,
Yao Zi
