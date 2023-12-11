Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECD57493
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 02:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/Z29bAl"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbc38f3fbc7so3394679276.3
        for <loongarch@lists.linux.dev>; Sun, 10 Dec 2023 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702262270; x=1702867070; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG4sHl1+Rg4Z/xgVyvuBLnRm0lugzakZ3vwchsyrEQc=;
        b=f/Z29bAliKVzUwLkr26Tv7ve/bUnWPG/+R9LI4Ew6dSBHhtyAK49Fq2yAgx+x7hygJ
         gcbjIjwmC36vZSyZ4ROFQP+LPfEE3usSaGEGLTRfWDSwoaWOq8amEtI2RW8WCupYVoVf
         Q4JkYXh5zc/UHJNJN6eKAmDIs0OBPtcvumSiMWEQ8Rg/SB5qK5KuFairslziKTumtFcT
         9qqpHHyxVhLq7hCeqxn9nCaDQbnciRAaDiENu/9OzaxRL0EANFzgvxOSSkXTckBOpcvn
         frJzcbZFx3INShmKWUH8Io49Tz6eT6MWbgGNzJHgO8WzEDVlaBiPatar2qrJlKCB0cqk
         B4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702262270; x=1702867070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG4sHl1+Rg4Z/xgVyvuBLnRm0lugzakZ3vwchsyrEQc=;
        b=s3iKWyzxEE6+0kSaKMSxHfA/rMQoePbjeKgO3HPQuAdbbQ+/6u4SGAIsWpzKenQQFJ
         bDkwA9XUyNlv7DwG06czF6pKaMar0NwBqvITR3HFlCKTVMcUMvCuyWYSp7m+ll2E2Hym
         tna3707S6MmUGpvZQk9EskWMcimhMPG4OCx7Cf3AeJ9i98j0IiP7nlQ5pnklCc/SU3nF
         clqOmkHtfh2KzKBcgPRwOWKfNs6/+44tp1s3BOj6RSi/yYY+IMDleDPFtInfazowxAXn
         pQ/g4Zy/7WzlNPg8/9j9zLWDHwca99DKMGcQgI5SqkD/Q/X3lHxWNu7j9njihuMBOa0j
         pTZA==
X-Gm-Message-State: AOJu0Ywl1MYBNTZDj8onA3YknMNd8+vgcj+zWYGqH7gzNBSmIsF11YqO
	KVfKMRg1XDJCWpRhRETmw1zvz4fb9wwbJ9rUgzE=
X-Google-Smtp-Source: AGHT+IF5P/iRJXIlAzvwBf7PlGge0Qd7ZNb+KBmDfz5v6QcSS3pTlCPdnzoEou5vtd60K+6uQEkZ2WmQPidVPiSRUjA=
X-Received: by 2002:a25:5f02:0:b0:dbc:6a10:5186 with SMTP id
 t2-20020a255f02000000b00dbc6a105186mr1240189ybb.41.1702262270533; Sun, 10 Dec
 2023 18:37:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1700449792.git.zhoubinbin@loongson.cn> <fc9b3afaf8826fd437ba91397eb7fa231db2c05c.1700449792.git.zhoubinbin@loongson.cn>
 <87lea4srmx.ffs@tglx>
In-Reply-To: <87lea4srmx.ffs@tglx>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Dec 2023 08:37:39 +0600
Message-ID: <CAMpQs4+dLk5KG3L0vF4ZBGqbCLKWtCCkQz4wER3yKfsii5GeEA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] irqchip/loongson-liointc: Fix 'loongson,parent_int_map'
 parse
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, 
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 10:20=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Mon, Nov 20 2023 at 17:06, Binbin Zhou wrote:
>
> $Subject: s/parse/parsing/
>
> > In keeping with naming standards, 'loongson,parent_int_map' is renamed
> > to 'loongson,parent-int-map'. But for the driver, we need to make sure
> > that both forms can be parsed.
>
> Please keep changelogs in neutral or imperative tone:
>
>   For backwards compatibility it is required to parse the original
>   string too.
>
> Makes it entirely clear what this is about without 'we'. See also:
>
>   https://www.kernel.org/doc/html/latest/process/submitting-patches.rst
>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/irqchip/irq-loongson-liointc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/i=
rq-loongson-liointc.c
> > index e4b33aed1c97..add2e0a955b8 100644
> > --- a/drivers/irqchip/irq-loongson-liointc.c
> > +++ b/drivers/irqchip/irq-loongson-liointc.c
> > @@ -330,6 +330,7 @@ static int __init liointc_of_init(struct device_nod=
e *node,
> >       bool have_parent =3D FALSE;
> >       int sz, i, index, revision, err =3D 0;
> >       struct resource res;
> > +     const char *prop_name =3D "loongson,parent-int-map";
>
> Please don't glue variables randomly into the declaration section:
>
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#vari=
able-declarations
>
> >       if (!of_device_is_compatible(node, "loongson,liointc-2.0")) {
> >               index =3D 0;
> > @@ -350,8 +351,12 @@ static int __init liointc_of_init(struct device_no=
de *node,
> >       if (!have_parent)
> >               return -ENODEV;
> >
> > +     if (!of_find_property(node, prop_name, &i))
> > +             /* Fallback to 'loongson,parent_int_map'. */
> > +             prop_name =3D "loongson,parent_int_map";
>
> This lacks curly brackets:
>
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#brac=
ket-rules

Hi Thomas:

Thanks for the detailed review.

Rob suggested in the V5 patchset to remove the
'loongson,parent-int-map' renaming operation as an ABI breakage[1]. I
had tried to explain that the driver would be compatible with the
parsing of both naming styles[2], but unfortunately did not get a
response from Rob.
As a result, I removed the renaming-related patches in the V6
patchset, including this one[3].

However, how the 'loongson,parent-int-map' renaming operation is
finally going to be handled needs to be decided together, and if it
remains needed, I will fix the above issue and submit it as part of
the V7 patchset.

[1]: https://lore.kernel.org/all/20231127182836.GA2150516-robh@kernel.org/
[2]: https://lore.kernel.org/all/CAMpQs4LSTV6PgZSuyQx2Nq+87OHxSa=3D-Wz5nbhF=
VsmmvHubQFQ@mail.gmail.com/
[3]: https://lore.kernel.org/all/cover.1701933946.git.zhoubinbin@loongson.c=
n/

Thanks.
Binbin
>
> >       sz =3D of_property_read_variable_u32_array(node,
> > -                                             "loongson,parent_int_map"=
,
> > +                                             prop_name,
> >                                               &parent_int_map[0],
> >                                               LIOINTC_NUM_PARENT,
> >                                               LIOINTC_NUM_PARENT);
>
> Thanks,
>
>         tglx
