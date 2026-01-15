Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A2288D0
	for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462748; cv=none; b=Gp5AHk+b1UV/yehOc4Y1BvZl0Up1qbOcjdXDxUV9h3dkX1BRCy/U6rGeEyYGczBC3kjJApYwJe4QEKd8qxapzSxHkjIK003vdJrENtZDSnCZzUxCTNcfgOfF2Z+eaaHq9DnFeQBHTenCHS6mvX5ZKAoj1RqPScawcR0jfvzHYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462748; c=relaxed/simple;
	bh=wahNfXhrWaOBKB3KgjZKVohw0NuT5yRlweOyGs+9Fak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0rCBZCvyal0NboqG3ZQ0RqQV6HmNmyFe1OqzuRuge8VpcdEyauATODdE7TtT81l3HvFqykLLTo8FxfJ9r3ALvzop0RlL91e9LSLYHAiiltdTkESKAf2gutjFURSqbDwWoaopc/RUr3+MT8o4OSn3GSpOD7Hi8lvz+99tRI/wN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WovEVaQh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WovEVaQh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-653781de668so813287a12.2
        for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 23:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768462745; x=1769067545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wahNfXhrWaOBKB3KgjZKVohw0NuT5yRlweOyGs+9Fak=;
        b=WovEVaQh2AVmAtlSYp7UhMYr4MJefAXnKPb4JhPRKLNA/C/+oiEDo6dQ0kc+5vyOXv
         qhqKwvaVyBxyN3/ZS6LE3b8HIRLjZt81sJX6TNd4KLQt9/YSAGLrQkSyhNHKb1vf2iPw
         9/SLTNG6FvK6dt3ODEw6c8ess1+u69WK53b51SFwQn/qH67q8XDhqONg4MmuC/yiY5o/
         LGjP/AbApCiww63zIDC1WpznRs8jCA+R4GcZ62CMBzuumz2temWXPprW8qvUg5nfhv37
         X5NOsJEx83bGGQEgivk2G4dfEsVMtIga15A62A7u+gHleoV4kftPzfo6Nwy+EpNvLQJ1
         gqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462745; x=1769067545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wahNfXhrWaOBKB3KgjZKVohw0NuT5yRlweOyGs+9Fak=;
        b=qNSlXfhnslJLZbYVCyBtS57V9b/28FHSlpJHIr5bY0+AfcIpoMpg0IDa06CFu4U6/X
         GYtiofRTQ/PPIqwvNVcfGXG65Hp38bikMAfpz6xJBV8inLU7G2NncE2nnPEfNsYG1r5j
         5YfJqVHP+KPizJmDZCbzAYij7IpGfv9C9Hlf/rFFi/Axtu60iWSwHkf5LubgNqyiyVP0
         CGxL3bxwjL++qFCiNFzwL+oFN4L6zOHJIjuyWWKWN1eFEJ2JgKigD72uBealViULrsgI
         nra22FOrsp1lKdRd3VlEysnuhOaBOeX3fDA0gJaPxvQZUysMobXuVjzQ5DHI2OMq/mR6
         HcZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5jDt2OaTOaDTdnuEYikZ7K1m1ZptfDoKpucrGscw0M+WdkZdoBm24RaSkpO9hcQl+tzddrq0kIP4=@lists.linux.dev
X-Gm-Message-State: AOJu0YydTIGMuJIRRwUEhG8gi/DpyaBTY3TwKg7IzNzdEPz188KTjud0
	4vPYHF7AF3gO7BL9hLhhXjy9S2/qb8VNouXBFNk6VDSXdndXlsgdCGMq8TLuJDf7HVaGXnUaohF
	4YKMTKOuw+0/FlPaJwh5KvYE/eocL3e4=
X-Gm-Gg: AY/fxX7nIfyJza7W6T+NiaOQx7IwAsKv/Hu/ik7IrGHCcqXt8MPE/fGYeTt+1DDXTkx
	ibsOkACCPr0AG6YyA0jH23qsBMQeQAFmE7mRbmQFl6QLecuFBfWtFNi1O+JQS+D6jngFjekOb5c
	bqG7kzETuWOfjZK9OzEqc+BkhOS2L0SWhuXMsf8mnX0BlojqjPnaVGIiiXk0F4Vn/hZn8Ueoc0s
	daaoCBjkP+UR//OAfP4+r/kiIQnsj+fC4KaNf9Ec3ygI4pvxAB7qHUzixkG94WrjG5LoUX2
X-Received: by 2002:a17:907:5ce:b0:b83:9767:c8ba with SMTP id
 a640c23a62f3a-b876775c257mr364217166b.17.1768462745211; Wed, 14 Jan 2026
 23:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org> <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
 <20260114205855.GA3190839-robh@kernel.org>
In-Reply-To: <20260114205855.GA3190839-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 15 Jan 2026 15:38:52 +0800
X-Gm-Features: AZwV_QjRRxACkfvlwb4vl80In-Ga3y0YpHc3YfqsZdPdlGNLPswkM9BXr7n-Nnc
Message-ID: <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
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

Thanks for your reply.

On Thu, Jan 15, 2026 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> > Hi Rob:
> >
> > Thanks for your review.
> >
> > On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> > >
> > > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the R=
TC
> > > > interface of the Loongson-2K0300 chip.
> > > >
> > > > Its hardware design is similar to that of the Loongson-1B, but it d=
oes
> > > > not support the alarm feature.
> > >
> > > But you are requiring the interrupt property for it? Isn't it no alar=
m
> > > feature means no interrupt?
> >
> > Yes, the `interrupts` attribute is not required without the alarm featu=
re.
> >
> > But my judgment condition is `not contains` (added in patch-1[1]).
> > There are only a few SoCs on the Loongson platform that don't support
> > the RTC alarm feature, so I think `not contains` looks cleaner and
> > simpler.
>
> I should have said allowing rather than requiring.
>
> You are allowing (though not requiring) 'interrupts' for Loongson-1B and
> Loongson-2K0300. In patch 1, you made it required for other platforms
> which is an ABI change. That's fine if it was a mistake and is truly
> required.

Emm, it's true that for the binding interface, Patch-1 is indeed an
ABI change, but it's more of a fixed patch.

Throughout all existing Loongson DTS{i}, RTC nodes decide whether to
include the `interrupts` property or not based on the alarm feature.
Loongson-1c rtc nodes do not include the `interrupts` attribute [1],
while all other Loongson chip rtc nodes do [2].

So, while this is an ABI change, I don't think it affects existing
Loongson DTS{i} rtc nodes. Also, it more accurately describes the
features of the corresponding RTC device.

Therefore, I would like to clarify it in the Patch-1 commit message of
the next patch version and fix the error in the commit title:
dt-binding -> dt-bindings.

How do you feel about that?

[1]: https://elixir.bootlin.com/linux/v6.18/source/arch/mips/boot/dts/loong=
son/loongson1c.dtsi#L98
[2]: https://elixir.bootlin.com/linux/v6.18/source/arch/loongarch/boot/dts/=
loongson-2k0500.dtsi#L486

>
> Rob

--=20
Thanks.
Binbin
