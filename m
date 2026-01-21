Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3877042981A
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978342; cv=pass; b=Q+1gQeoHpMRd8i87Mbr38+XKThUPLBxKh1DC4zxcCWcEmqWxiVuwasE3GznHBOT/Z0MIjjGoJ0c7JM8t/2ffF6iVZsxBIQvOpplNlgCJd06as706LUhkRLBiN60SlXQ5Q+dz5aJ/KKzSL0AagDNRJPI/QzlmXTBEJE+vgD5jwYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978342; c=relaxed/simple;
	bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HX0lmzKa6+0zuT8vennTmqZP6kzJhZtMa8t99Zn5aBONXO6MrciJAOtQsll//BPIeEA1Nt0fSCerzN08AitonvxOwqEbmruyNu2k4Q2RlWRi/pti6YqmiA7PGtXjKhpGe0H3eBc0GMTS8O8E656iSGE6F74XhN/6iWnSB/bQrnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkSHHNXx; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkSHHNXx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b87677a8abeso999355066b.1
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 22:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768978338; cv=none;
        d=google.com; s=arc-20240605;
        b=J5wrFbHbsZEuSeTeJCG+RRJLKwenQQ5KTsAVulzdTu7BLx3zb+nC09KK3go5+QTiyr
         08vDCgzqGPY9pkO4mqhX+9i9N62/d0SdIxmRyQUCQX9chxEspf3i5mjhVP/01I1TwXXi
         8ALOffN1JgSVyiDNb05D0UicSHVuTsjR1VZA3PF7CfECfu5Og0T/dckNo7BSi2UEvIUZ
         0pVXI6h9DFhiDwIiYJTiF9twz3TVxd49G/k4ZbF8ohQv2wweFPsMO/ps2vpNtU5OuRRU
         hwKz8/NJ6J3QsjY7Gvm0ocAtXvhqUm7ev4q1TOoZPizKxZhh0k9tA9Lu1Magi5uXbwHD
         1C4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        fh=moyeaLFwqUhbFgAbe5GsKdcokuHaLAAXeqo+VkIR4dg=;
        b=LXxeE2FOw7weRtPg+WBGSHMCEG24RVVCTkZGjvOPmNfqJOY49X4PZlyxp6rQny4wNr
         cObYt3aoBjoBDFhNd96abIb7hCBYiNaPtkXOkDI4tFgnYQ7M1e9TlS0g0PaFOkN6Qlhv
         PVdABbqIQDsXFDvXs6Gg6WxssilZiPTQoXrnHFuprFDxHltwxQAs/8tf0h9eneHlEkwQ
         ZwlQErdOTZ2nQpoQywm8z02sZJIMjh+TF0Axoiea4t9QKJeZsr0sh0JxZS1Elu5XM734
         o8tJ8svhzMoR23pNF0Xb6+RJXxROc90y8CHSMSrN+zAQo7bZhb2H3vySbvnvux3CKjvY
         Bf8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768978338; x=1769583138; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        b=AkSHHNXxYxL+oPsqKgiPWZ6W7IWDhDi/P1IbyHaUPRWc0Ha9yqgM3B5CDhQ7LDnwOO
         QcZtpS+9o4nRrQ+t/vdwNjlcjQacKparq69RRfPG/RSt/m1rXZh5UjKYL0lfpyTmZLEi
         92+O5vXaoPTR8ccTFjUhvxVoXJYHttGKsIFHHkRLkZQYdMYLlw9zrDhjwacAIbIDO6pL
         HKv+btyhKVmcemZ+ORT4Mfi87w+At7PLj2t2Ng1vL+GFi+DaF0AbMP9o96QMx/23R3gH
         L8imT6kWbA6gpxDOOkZjICVSuNpGXr2Q68Z0sQNCnK35ZOEL/YelySrI7fpHGdVCvr6h
         K9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768978338; x=1769583138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        b=CUmxq14WHKDjaTyD5ofukGK6dyPYmBNEN4HQt1lNkHDHRNCDYUDKaaENt8vfVhhje+
         PcEjm6RBJ0s8fqXwMtoH1tF8a218c5bX+wTaG+oHhES6tDntgjlkzEpptMbbmcHJ0fQW
         rqs9aTbnvIj19ig+H2waS4MitRosGCyZKc8Xgv/y6d4DtEYo8aYpbtsJm8qeRrIjyRqn
         8CHlgZZvjp7D4r8FEB17AnTlqKa3sDwZwmuCFvjsR58+MJA4TKPwlS1eehSZcBHNRfn+
         exLXX8/2SEFNivpHsBI1/ea9nv4h4RcP/wP0mtPA8My2x8MlTOKkbdaPkQSsFDqAvqIo
         fVqA==
X-Forwarded-Encrypted: i=1; AJvYcCW3FLxYezjWjcWo0tJoKw90txKcZW30bJWJe5U1Z1jz8C7T5bndb0GPfTEGyTuoTjknBdzkZDzcjWg=@lists.linux.dev
X-Gm-Message-State: AOJu0YydVyybcg519Yz8/Y8ZrTIZIAV3YtPAJ+mQaXGfQDB44CLhRfsS
	9S2I4brcSIXj5IrMwWdFd34HEvxIofcOZzkmbYFlLVRTpriwIgyjsBaK3dR72s9SAvdZiTcN6SU
	CfhfyeGeJbHp1GOG3/KKREeTIwUSsRTs=
X-Gm-Gg: AZuq6aL25oCIrxRPSxYkgs/IKCkHl7VqdEkc1duCGtmBY8EqjAeb+xK+YTp+AqZY5Gb
	Qo9vUcAZOOKIOr9lKse/UISnvf9IOQQizfbqQ2gYhtj0CigtjfgzMIoSEWPo1yuGkToFphBx0sD
	O2DplPvKmhiJ7AoTd0AGR+au1PpPhnLM5ai1vTOFDRTQlJiQOzID554yG7N79M48U6PZVzfHcuk
	QQKDgNOAxQGHXGbYbxCdkTtKuXeV19eKDSTfh364JAi9vQ7hPoWh4JUS5p6AhZMZDJS6e4=
X-Received: by 2002:a17:907:3d42:b0:b87:35fc:ae6e with SMTP id
 a640c23a62f3a-b879327dfb1mr1455742566b.46.1768978338185; Tue, 20 Jan 2026
 22:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768616276.git.zhoubinbin@loongson.cn> <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud> <20260120075045e7e864ba@mail.local>
 <20260120-cubical-harmonica-a7b7bbb26b08@spud> <20260120224920df0cf2ac@mail.local>
 <20260120-proposal-retry-d0a1f3de10ea@spud>
In-Reply-To: <20260120-proposal-retry-d0a1f3de10ea@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 21 Jan 2026 14:52:06 +0800
X-Gm-Features: AZwV_QgA6UvIfzq-IFvgjS9upO0HXk3JXVuJsZZ81j4MJRt35v5CeDrdmHWS9o0
Message-ID: <CAMpQs4Lm1Oq8L+dY8OnseV-NNUoD3+0QjnZATRkmR-sejCKAdA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor & Alexandre:

Thanks for your reply.

On Wed, Jan 21, 2026 at 7:39=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 11:49:20PM +0100, Alexandre Belloni wrote:
> > On 20/01/2026 19:24:09+0000, Conor Dooley wrote:
> > > On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> > > > On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > > > > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > > > > The `interrupts` property indicates an RTC alarm interrupt, whi=
ch is
> > > > > > required for RTCs that support the alarm feature, which is not =
supported
> > > > > > by the Loongson-1C RTC. We exclude it for a more accurate descr=
iption.
> > > > > >
> > > > > > Changing the `allowed` property is ABI-breaking behavior, but
> > > > > > throughout the existing Loongson DTS{i}, the description of the=
 RTC
> > > > > > nodes conforms to the modified bingding rules.
> > > > >
> > > > > Right, changing properties is an ABI break, but when following th=
e ABI
> > > > > would've produced something non-functional, breaking it is not re=
ally
> > > > > relevant.
> > > >
> > > >
> > > > But the HW has the interrupt, the fact that is not functional doesn=
't
> > > > mean it isn't there. I thought we should describe the hardware?
> > >
> > > Does the hardware have it? My interpretation of the commit message wa=
s
> > > that it didn't have the alarm feature and thus no interrupt? Unless t=
he
> > > interrupt has some other purpose, in which case yeah we shouldn't acc=
ept
> > > this change and only the new device should permit there being no
> > > interrupt.
> >
> > The datasheet shows the interrupt coming out of the RTC and it has the
> > proper registers. Why it is not functional is not clear to me.
>
> Right.. Perhaps Binbin can explain that then? If the interrupt is
> actually there then the dts should get fixed instead IMO.

I carefully reviewed the manual again and believe this patch is still neces=
sary.

First, the Loongson-1C RTC does not define the timing interrupt
register (`TOY_MATCH0_REG`)[1], meaning it lacks hardware support for
alarms. Consequently, `interrupts` are also unnecessary.
The Loongson-2K0300 is different. It defines `TOY_MATCH0_REG`, but due
to a hardware design flaw, accessing this register causes system
crashes. Therefore, I must also classify it as lacking alarm support.

Additionally, in patch-3 [2], I rewrote the alarm logic to decouple
the `interrupts` property from the alarm feature: I defined
corresponding workaround bits in `loongson_rtc_config->flags`. This
should be considered a SoC-specific attribute.

Finally, two thoughts:
1. Retain this patch; it is correct for Loongson-1C.
2. For Patch-2, still add the `interrupts` property to the
Loongson-2K0300 RTC node (as it exists in hardware), combined with the
workaround bit setting in patch-3 to avoid the hardware flaw.

Would this approach be acceptable?

[1]: https://www.loongson.cn/uploads/images/2022051616223977135.%E9%BE%99%E=
8%8A%AF1C300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C=
.pdf
(section 21.2.1)
[2]: https://lore.kernel.org/linux-rtc/abff68dda2fe6a6601a9e58b31e278d94129=
7fce.1768616276.git.zhoubinbin@loongson.cn/

--
Thanks.
Binbin
