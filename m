Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E3118859B
	for <loongarch@lists.linux.dev>; Tue, 30 Sep 2025 03:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759201425; cv=none; b=s0kRO+5OwymhJQfOIEB2VztpLpUq/6Od7OA8KE0C1G9VgMjDvIhL1Zl7x4jashGQj48euSQZga7pm2l0SicOEBnorNLIfNAHq4bIq7oS6qjpFy5wC3HeMcuO5BTt1QI3OyqpQ8zgxCHxAKtqfmxz6QpgsoDINBzqTtDLhPQv6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759201425; c=relaxed/simple;
	bh=TlSrEI1g4LJ14N4ECMUQYeDV9+p/D6qPn677XjVLXis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=He9SwFzznEAJMLCVIKQFH1B0bRctLggIkQbo9pDNjawXhj6OXYmSp1ukvMVISoRWtsM4VkHzUf9nBczqc7h9GYgZj1OcgXJUH4GUYTG5rWPhs3cRPCWPTWiUTDrL3kyDbdawQ5yjesiUd9BLdaKKCGoVHdtD42CKMJPOU3SyNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhNWwL4f; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhNWwL4f"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b00a9989633so989881166b.0
        for <loongarch@lists.linux.dev>; Mon, 29 Sep 2025 20:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759201422; x=1759806222; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NFP/aRPpSqSxRRCDSAPryYMxFsX/KQ2AaIdR8RyNrI=;
        b=fhNWwL4fzb/4vFMQQ7MabtB9BdzCXadEIaSn4/7zWHLlez5C630a6oUregKD9wj1Y+
         gSIcbo8gRRa1GRYrJcpGLgNH82QHUEEm6KllmVJ3ybASpQx66De16d7kQT98tbL4r3ma
         haBvJcwKEgixTFsxNkXPAtnprzI5dmPan3TCkLjOZ9L94lT9GB88o7C93Hui+EwWh+3f
         PZHR8vn3UQKYyu60A5uyRblNgkrb7wsTa0hc5ZLHIF54NbInUe+vv6faAMuaHxAkijwh
         BHXSoerNJG3MG5CSnUVqtM7X3WahVxG31oeplhojv67CFCQdLHYQFf8QQahIeMc3eHzr
         qfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759201422; x=1759806222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NFP/aRPpSqSxRRCDSAPryYMxFsX/KQ2AaIdR8RyNrI=;
        b=NWJxd5P4ycXPoKoY9VhceA7XGB3NJK9JwfbyC01nTKQ6eoZwAHux7IiqIVWUKk1QVY
         yRSJHuTWQsjynZl8PRPuhoMBIjsTaCclUSD3BV7nU1ougXdlAPyxLoEJgFwKxRDo0MYt
         LCBO0qH5P91EsmIBV0m+B0w8JQNyAijRYnmi+SLvuphZTiAXJxSH5uHRuAeHV5obYLuX
         3zYlUnC6XvA7bSgZ0ksg2cWyMoZ43JxIWbHyIuJV6RarVAD9B2TsYrdbEZHBcCV9fAfS
         xIlLaJtT4hLetPlpqL5eOAtzan3EuvFQkl4ci9PFnU3OVszd/dejaCn8l3sf7ngXCEq5
         /8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyf60DXgqx+1akhHU9YDifOwQ6gf3Cstrl8cDqzn4S4E3FN99POvAA442jYp2k9/CVgpcgG/GQBGA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6pVhm3yzMmbEkHPP0cLjSNpGCXvDIhS0nY4R8lY0H/MXjhizO
	IenHYs7QRq5xFQBT/8ORE612G56xXpftvGJDvfHS95Yqm9OOmox8lNAmmZYcMum4CeuK3SRw5Y3
	H/GaJNe0X5KsAbLyn5ISH5T6lOmMn4hg=
X-Gm-Gg: ASbGncuaKrCf5rnPBqA4dru+a4poUroKwIKEEeIQLDSiQtoHbHjSUTYzEQhfrtConW8
	wBtgTBr6vXR7o1wc42M3UJciisr5AMs7EpPyH15KK0h3OwQ/uHKET79qltmgjQe/zjgHrHyRTkX
	TxGyTBkf0Nb+I8Z4fxfWLELcLhnW1pY8V6QQoNUTAUwr/NSSPmeh4UQAIVW9XbUBLwcqP8hC524
	8X8TRxuuTs1vK63/Jb3pKyKUdyEeRmCAA==
X-Google-Smtp-Source: AGHT+IF/n5rxioCLmT/RhA4+s+0eSGWB5ynhr3d237Tn0J8d1xLcsm+RN0zUj0iTmh5Xi96u/TsBTy9XttW3rYTj7eY=
X-Received: by 2002:a17:906:6a13:b0:b3d:d30b:39c0 with SMTP id
 a640c23a62f3a-b4138d54e8fmr254813966b.21.1759201421958; Mon, 29 Sep 2025
 20:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758676290.git.zhoubinbin@loongson.cn> <9823e7afe713450e210dab9dba6fa18683dc1fe0.1758676290.git.zhoubinbin@loongson.cn>
 <2025092428-glade-monologue-3663@gregkh> <CAMpQs4JgR=iG6LAuYeVxOpE31S6n=dC4+FGUJczOYDVfWHDuFw@mail.gmail.com>
 <b862846d-fb2a-4df4-8457-d858aa63031d@kernel.org>
In-Reply-To: <b862846d-fb2a-4df4-8457-d858aa63031d@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Sep 2025 11:03:29 +0800
X-Gm-Features: AS18NWCm6-Znvj04Md8NL1AWVBDpMDNMtoDJ4KZsLhmeYeLRSp3jYSKwZzNeE88
Message-ID: <CAMpQs4KVgSFk=B5JtQ1KM02HydTkwaYqi+LzzhdJAyoSUfAxLw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] serial: 8250: Add Loongson uart driver support
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haowei Zheng <zhenghaowei@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri:

Thanks for your reply.

On Mon, Sep 29, 2025 at 2:19=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> Hi,
>
> On 28. 09. 25, 4:48, Binbin Zhou wrote:
> > Hi Greg:
> >
> > Thanks for your reply.
> >
> > On Wed, Sep 24, 2025 at 6:22=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Wed, Sep 24, 2025 at 02:29:37PM +0800, Binbin Zhou wrote:
> >>> --- a/include/uapi/linux/serial_core.h
> >>> +++ b/include/uapi/linux/serial_core.h
> >>> @@ -31,6 +31,7 @@
> >>>   #define PORT_ALTR_16550_F128 28 /* Altera 16550 UART with 128 FIFOs=
 */
> >>>   #define PORT_RT2880  29      /* Ralink RT2880 internal UART */
> >>>   #define PORT_16550A_FSL64 30 /* Freescale 16550 UART with 64 FIFOs =
*/
> >>> +#define PORT_LOONGSON        31      /* Loongson 16550 UART */
> >>
> >> Why does userspace need to have this value exported?
> >
> > Sorry, this was a cheap mistake.
> > It should follow the existing latest macro definition as follows:
>
> That was not the point. The point was why do you need that at all?

Emm...
We attempted to define Loongson UART as a new `uart_config` entry.
Therefore, `PORT_LOONGSON` is referenced as follows:

diff --git a/drivers/tty/serial/8250/8250_port.c
b/drivers/tty/serial/8250/8250_port.c
index 719faf92aa8a..53efe841656f 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -310,6 +310,14 @@ static const struct serial8250_config uart_config[] =
=3D {
                .rxtrig_bytes   =3D {1, 8, 16, 30},
                .flags          =3D UART_CAP_FIFO | UART_CAP_AFE,
        },
+       [PORT_LOONGSON] =3D {
+               .name           =3D "Loongson",
+               .fifo_size      =3D 16,
+               .tx_loadsz      =3D 16,
+               .fcr            =3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_=
10,
+               .rxtrig_bytes   =3D {1, 4, 8, 14},
+               .flags          =3D UART_CAP_FIFO,
+       },
 };

 /* Uart divisor latch read */

Additionally, `uart.port.type` will also be assigned the value `PORT_LOONGS=
ON`.
>
> --
> js
> suse labs

--=20
Thanks.
Binbin
