Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD4D317712
	for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755339904; cv=none; b=QhIDDDDOb4d7zernNGhwAgCT3ZRE8iTZUZNgrsPF/ytovZYgRtDJn+BbOh2mfa3SabzGZnBlnCUoPi7xfiO81z0C/37uGDiRcZ3qpYFCDYeRRKpb9wpQIC6vfq3K/1ArpgqeKS4K5CELnCPl9IJfKcQpNyYoZ8qQ7N31/FSvjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755339904; c=relaxed/simple;
	bh=PJU7htTDQ2hko0s3DIZZxAA1LpnKiMLmKn61cStMIsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGmE/zuV16R0UHmWoFx5bg+p0J/QFSV4ZoSNXafqdC8p+FLIonklffoFEYy2e4iaHUdhER0q8hPKjUtlpB4o+34nAP4OiL2I3oErafCOXuPD3mBLqVBnpWWHj9c7qcecWBvd2EiC8jR1961OWOcmlrawqMs958mP1gB/8vdHUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IePDLVGZ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IePDLVGZ"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CAEC22080B;
	Sat, 16 Aug 2025 12:25:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXE75Uhcr_XP; Sat, 16 Aug 2025 12:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755339900; bh=PJU7htTDQ2hko0s3DIZZxAA1LpnKiMLmKn61cStMIsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IePDLVGZYTzkNTAyL7QyTRXgQt0HbfqnmuB8PnhjCm5o3baBccG3fuAGEV8OzRAvD
	 71MrSNLUA36NorOmr09RomrbRUaDhgDE3hZr0SBQ851th+G2rHH+9qmai2d6gv7jbw
	 QpviGwFc+TUHwMYBlGyD3LIfEwioIn9nE0WBcq/UWsH0l0Wo8aUFlTYmXJVyywSSdA
	 yJRqiTMcaZmLMD/M8PQKH1Y3OYw7vdwXs3Ky0PCYz15XvfaC8EwWOTsyocS8Yvqx+v
	 rDDQSDJaIlnMYyI9xuCvWadC1S0L8OTBHJ2CFvsC6GlR8t3UjqdnDaqC8u5HpiQ5Tc
	 93wwm8/LmllVA==
Date: Sat, 16 Aug 2025 10:24:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Document reset controller of
 Loongson 2K0300 SoC
Message-ID: <aKBcbUbx-hgNBOY_@pie>
References: <20250816033327.11359-2-ziyao@disroot.org>
 <20250816033327.11359-3-ziyao@disroot.org>
 <d5134909-58a4-48c2-a227-2fb3ce200c2f@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5134909-58a4-48c2-a227-2fb3ce200c2f@kernel.org>

On Sat, Aug 16, 2025 at 11:48:46AM +0200, Krzysztof Kozlowski wrote:
> On 16/08/2025 05:33, Yao Zi wrote:
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    rst: reset-controller@1600011c {
> 
> Drop unused label
> 
> 
> > +        compatible = "loongson,ls2k0300-reset";
> > +        reg = <0x1600011c 0x8>;
> > +        #reset-cells = <1>;
> > +    };
> > diff --git a/include/dt-bindings/reset/loongson,ls2k0300-reset.h b/include/dt-bindings/reset/loongson,ls2k0300-reset.h
> > new file mode 100644
> > index 000000000000..d425411e6d19
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/loongson,ls2k0300-reset.h
> > @@ -0,0 +1,70 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> 
> Why not using same license as the binding?

I was referring to another binding's header when writing this, and yes
it's better to keep them the same.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Will fix these issues and carry the tag in v2, thanks.

> Best regards,
> Krzysztof

Best regards,
Yao Zi
