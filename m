Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3449E2BCF41
	for <loongarch@lists.linux.dev>; Thu, 11 Sep 2025 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577320; cv=none; b=g4RtfzaSQ5IhGbwl0QS6s5gADrLobx8NxPBIFmlpj7+HQEmwgeu20Ma/j3Q54VPNJot7DFidMisMm2JBLI/kDWq8xebZhCgYpY7Nv8MUm7Xr21vzlU5/Zfwn+RnZkFbAmCaP0o5UJCrLPmJEudlA2u/TUZmePZpXyAJheWOfmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577320; c=relaxed/simple;
	bh=uW93kY0+OZCRekYhUWm/qQ0d+bv3Ef14UmeWSYv06cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srftDiqZqKgxT1LY6otx2VQvMjLFPfPTwoAaUHSpxIok8DSO+XtQuMVkHgYN8vHqsiJtmWVdNz+yI5m3va+qiE3EJ2qabiPDRb+7iZYdB141865EMmcAhBRd2R/Eh6BGc2W8nM7spFFdxaT3qQQ4vSxcLeS+ICYw/SYhXHwuBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leS30AcM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leS30AcM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-624fdf51b44so497652a12.1
        for <loongarch@lists.linux.dev>; Thu, 11 Sep 2025 00:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757577317; x=1758182117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/Zni9gQlrJqNXECo6PJyQCl0lpKWQXeS/S54r6ee38=;
        b=leS30AcM7PLwqoygaeHAyJ+MrvB04SVuyauALSz2Km0Z89ExLr4FjltO6kcbSEonPT
         OjBWKTSHMMjXnOu8i5iYoOXcd+QaVo/AGviOeM2qZu4AvlVutpudtqvffxwyDW2rob3s
         dFG6AMUI94Y1EPegKF+j2hqf60ikR9b0LDCbr9jLOst+Y4Vj1yZBUaKOYA8dtNhvyXKE
         m3oXsL726o/SiRgxCvguELoMxagOFD/GIZcS+gsc4JTmn7486u5qmjJSqrdvlVmXfSB0
         MNyYGga+oYZ9YiRs7i6oxsvHllOE8hC4PSr08rH4NjD3FpwArpb5l1wkVKbbao9bG47q
         eQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577317; x=1758182117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/Zni9gQlrJqNXECo6PJyQCl0lpKWQXeS/S54r6ee38=;
        b=m9n0sHMBt54ejYn8lZK4vThh/ABUF2GtzF6Cabqgqhwn2ypY6YnhQ42U+5UoLpbe8I
         +g/MJg2jdff/TYVrPxqnD+125VP47nPhM1X5+ePLSsOipcog1zCLpBCQhf0nYtD/fN3Z
         t+X5iKLMdwW4FcdqDvZ4qh5CbAg0iYUja1NTF0TVPcNVhlrnS+akddovMfZIpEkb31cz
         I5/pgpkfpgUhyvGAj4biRQxt5gtPCwLXHwTSbog9GLZLIIf7TBMQykN4koPU2gMgnPH2
         /+m15ULf6he0d9HAzp2RLDou1i+Z4u5j/khZjO139GRTZdPo+armgLD2+lAc03DZdp1D
         7b0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPbOXDYxB1zVmgEmkZ3btB/GLHz8+lvjwMGjFe2CGQBZGuQ4uUXrpdobPTyBTrPqC1Y7YCvmcen8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzefaTc/ixwTkNzNZYGoXMn2V3cMLxxwIFrMpTHxqj+FLg17bSP
	0IO0B4Iz+IIb8GX3cEzCq0/WOhYFTZ17ycHLJlR2yA9xZgOJOaw5WHIdH6owKquHs80vfWfyuy4
	nkxNrIlUWJ48u/L6wdnw3Tz+Dtam6vRg=
X-Gm-Gg: ASbGnctRiHovWRRLPI3YnqxpUj+fCA3tbNquDitGbMFkB21j6+1zHJglOROb0jXKuBV
	JuYgEcTgM86LCkFV//0oasL9QzXT72h2QkHV3u03OOFkS0eE2DwLAWRLT5cpSYMeVZg7vFbA9FH
	UTkcBow7PZcvwQOl0S+doobMfiUCVJ31XnWR5iUu+jQD4PdSm5kLYl5LhvcQeX9NVPpHreoe3vZ
	zAz5jTV/A==
X-Google-Smtp-Source: AGHT+IEQYL88af+znhDJjCoMbmK7lED2mZrcyiOVZkFqEOFz4gATF4l90/Zv3H30LLZwTPuhz78xnP1a64hjMASXg/8=
X-Received: by 2002:a05:6402:4406:b0:62c:34ed:bbed with SMTP id
 4fb4d7f45d1cf-62c34edbf2fmr7977478a12.19.1757577316373; Thu, 11 Sep 2025
 00:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1757318368.git.zhoubinbin@loongson.cn> <2f93b8f20c6e93a15258888998e926814bfd0adf.1757318368.git.zhoubinbin@loongson.cn>
 <20250910-fast-seahorse-of-valor-bf6c86@kuoka>
In-Reply-To: <20250910-fast-seahorse-of-valor-bf6c86@kuoka>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 11 Sep 2025 15:55:03 +0800
X-Gm-Features: AS18NWBY0ItJVlEtg4-Jrs_bUJGB4ODfYLmQ4u0lZWjWBEGzhnR72KNCiw8ZDmQ
Message-ID: <CAMpQs4K-6Re=-gELPEg8kP_NKR5_1U=BD6fnXM3wgUF+eMtpGg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] LoongArch: dts: Add uart new compatible string
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Haowei Zheng <zhenghaowei@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your reply.

On Wed, Sep 10, 2025 at 4:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 09, 2025 at 08:11:20PM +0800, Binbin Zhou wrote:
> > Add loongson,ls2k*-uart compatible string on uarts.
> >
> > Co-developed-by: Haowei Zheng <zhenghaowei@loongson.cn>
> > Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/boot/dts/loongson-2k0500.dtsi | 2 +-
> >  arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 +-
> >  arch/loongarch/boot/dts/loongson-2k2000.dtsi | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loonga=
rch/boot/dts/loongson-2k0500.dtsi
> > index 588ebc3bded4..357de4ca7555 100644
> > --- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > @@ -380,7 +380,7 @@ tsensor: thermal-sensor@1fe11500 {
> >               };
> >
> >               uart0: serial@1ff40800 {
> > -                     compatible =3D "ns16550a";
> > +                     compatible =3D "loongson,ls2k0500-uart", "ns16550=
a";
>
> You clearly never bothered to actually test this against own code.

Sorry, perhaps I should have included more detailed descriptions in
the binding file.

As per Chapter 15 of the Loongson-3A5000 manual[1], the Loongson UART
registers and functionality are compatible with the NS16550A. However,
generic 16550A drivers cannot support full serial port capabilities,
such as hardware flow control.

Based on your feedback in the V3 patchset[2], I attempted to use
compatible fallbacks to avoid API breakage.

These fallbacks match according to the Makefile's compilation
order[3]. Therefore, if 8250_loongson exists, it will prioritize
matching ls2k_* compatible; otherwise, it will fallback to ns16550a.

[1]: https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-use=
rmanual-EN.pdf
[2]: https://lore.kernel.org/all/51f564ea-9507-40b4-a943-23bdd330e6d6@kerne=
l.org/
[3]: https://elixir.bootlin.com/linux/v6.16/source/drivers/tty/serial/8250/=
Makefile

>
> NAK
>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
