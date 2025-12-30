Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4D2BD5A7
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061934; cv=none; b=QVcOxnfxXQFdSZyDO1r4ZT97E3B7kydTRSh4MmXLMp7d2j6xjkox9KEqz6TOibMWz/OlujJ0xT/U/V33fdzG392UzujPw8m1pGeOYTruDvwVQM0opp6JfJjM8HxvDrNwkeb/dzQ25jjquis8vOZn+QCadYzcjV14ZGEF4ESlat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061934; c=relaxed/simple;
	bh=UMHU9FmII2BurntGYXoChYkmEDJXCqDMzuY736PKDTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxkDA+dVb/O1/arEdaBV2DsnUSvPK4vYZV4cq1pN02wsjHHiDxqviJ89B77W5Qe6AXpwLN0thOBkbHsCzC2Ms4rfQbhMVN3R+JIGbFpckMN87l+l21EaHWi0LqypH9DlWlnPLeIBuyImZ7JsfscJJ/3b1wSgWvJQin3FE4RHrkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1e5rB1y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1e5rB1y"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b73161849e1so1852931566b.2
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 18:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061931; x=1767666731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBMHX2/QGEuOryuyCmbWYYHbFM4ebeYaX/cSO55xE1E=;
        b=A1e5rB1yimNsdDHjgKdv0xl4Uu7UaQ3gOxc2Ex6/EicGCsGn2zzuM/Vc0mJMNSbsJS
         yHd6P+d/yVOPYJ7dxm9pawBb57CSFsb14Ous2DLK5EjeZVJ4DtI1NY/AgWI6sx1p+0Ab
         RCchEtu5zRKvn+HPL1s0xNE6MWOJgSBxLlr/J9DyZQtjAogYfTjrjV8/r566Erw5jdgr
         UTPV32lju51NNBsd40XxvcDX+IhtkBZDDCynNXhLJ2Sxo1hsSvsIOBmA0k+e78Cmqlol
         FVICiAf8UePULDGlDY1FIQJoqPtAUwFloWs8HLNxyfib32rXVpQbezm7JD6zjRiHqRtK
         VGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061931; x=1767666731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sBMHX2/QGEuOryuyCmbWYYHbFM4ebeYaX/cSO55xE1E=;
        b=M4X2u+GIkq29x6xeYVA2DXLwFdJ6bFwc7eI8YG8lkMTL9krU7joiO9mfbdtdA0HtCa
         8+LAq03mlZ/NRsdXvCIMU1gt06DXgzAOVK/v5GCfQI66eqrqSR6vzY7qm/hAP3i+pJKs
         gvA1iVIUU7l2IwNtDIe9tIzRUmqZfVFmnG2tC8pF1JCAdgzVKkRSOkFX/XJky3GW+rek
         mzJcwibIVWhsWfw4obRGn1s22e46BkkX0Q1G2pA2cM4qJQQJRmcqky84SfMAh3nLoUpJ
         D/XrazBkS6Pb5+hT7/j4GoElhsjOAhw6P8L3O5oi3THw7MnpzMH+JkIkzNol5xMkeHwQ
         f6DA==
X-Forwarded-Encrypted: i=1; AJvYcCWCVCJUCUNqXRXHCCfu536NWgvY0lvywhP/oZRjPgaMDqeBKF3RzT8VpbEeBu8QX+Ahdxg/r1vPDyY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz79xKknEBJW5UZALSB46KCfNID2MqyWQxjhy/NgrW2WM8PoPK
	4c6Gmbgb6Ppw68x+bM7z8CBfz6g1BMDriHExht4MbmHP61OMt8A9DGpuj0GexX0dSgwxjeWRecV
	T6PwTwizOzd5xJYXGy/oA698ei+2LbUI=
X-Gm-Gg: AY/fxX6BwTN0r5mQM9D+RQU1A3dnsMoiBvQrAI6QoDOFuKBxVvAmEJ5qmZWMvR3K8iZ
	Xn1/98kSuwytyJQ4BJY4gtD0qRS+vsrdgvMQbxPT1Zupka8A0bceMwG55aQN1h/pnrKKreuhn30
	P270kZecazYOHcToKh8+UtzbhRPNIuNp2f0SAi1PoQlL8atYlijsEebNCOssYUFEfy5mAYLi6d1
	9h7sKoPiRk0F0AcGun/xGIv65yVumalC4RCl2Lpc40p/0ZaokU8wGiazLoRv7YaiVKgA4dI
X-Google-Smtp-Source: AGHT+IHRI/1hilnmEBrcFgJMUaKhYNaI/HUlJK981gxPRBIjFC1foGTgVsgO3/XCEuH6fbfjUrJWTnDdqb3jBT/2yYw=
X-Received: by 2002:a17:907:5cb:b0:b83:972c:77fb with SMTP id
 a640c23a62f3a-b83972c7894mr49876366b.46.1767061931091; Mon, 29 Dec 2025
 18:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn> <36544ba0d847bca639632ea0c74907de90975f80.1766471839.git.zhoubinbin@loongson.cn>
 <20251230021517.GA3156793-robh@kernel.org>
In-Reply-To: <20251230021517.GA3156793-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Dec 2025 10:31:58 +0800
X-Gm-Features: AQt7F2pMi81j0FMjvtCowEi-qdK1ZAjfhHDDJAMxPmxQUDHeMO8p72a4qVr-54E
Message-ID: <CAMpQs4JbqK2zD-s8Erzj0SPue=97hk7tYBanFiQiefzkof+QiQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Tue, Dec 30, 2025 at 10:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Dec 23, 2025 at 02:42:12PM +0800, Binbin Zhou wrote:
> > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> > interface of the Loongson-2K0300 chip.
> >
> > Its hardware design is similar to that of the Loongson-1B, but it does
> > not support the alarm feature.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/rtc/loongson,rtc.yaml       | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > index f89c1f660aee..aac91c79ffdb 100644
> > --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - loongson,ls1b-rtc
> >            - loongson,ls1c-rtc
> >            - loongson,ls7a-rtc
> > +          - loongson,ls2k0300-rtc
> >            - loongson,ls2k1000-rtc
> >        - items:
> >            - enum:
> > @@ -42,6 +43,18 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls1c-rtc
>
> This seems unrelated?

Loongson-1C does not support the alarm feature, so the `interrupts`
property is not needed.

Technically, this is my fault and should have been described in the
binding before, just correcting it now.
Perhaps I should have mentioned this in the commit message.
>
> > +          - loongson,ls2k0300-rtc
> > +
> > +then:
> > +  properties:
> > +    interrupts: false
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin
