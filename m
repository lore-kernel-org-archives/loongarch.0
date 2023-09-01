Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBF15A6
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 03:05:24 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-58dfe2d5b9aso20084467b3.1
        for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693537524; x=1694142324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzzhdRRz+84nDeWWLMEXfVPuhXA1oo9sQKDIU2jXLKE=;
        b=aaHZ1XSWxNa0/w7AznZGx4g/B3VyC40LHr9sivGtlI18/Ek2gTfYz0gS0eaujC1RfP
         zocCz+jWcEjJP+V2u1WpQ315DH2YzCSFwBRJ+761PXkifqgaRd0m5LSMM4OLAWm2rjhy
         KzF5BToFEkOOK+OqDcPOX6WCGzybeX4wHxFN3M4Aw9wrI9lWYvOkK0jeAxC23Cte4IRQ
         kPRIj+nmMyn4ycGDx5J6v9irt9utXYfFcINCxg2rowQcW2JlEJ9S5lcGMcSBW7b1S1Cm
         lojzE4RR47WeYKFFgJG4OrKHfh1Yqjiwy8koRGKK2xjaGkWhUsRn1cuAY9Fxympc+S2G
         J0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693537524; x=1694142324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzzhdRRz+84nDeWWLMEXfVPuhXA1oo9sQKDIU2jXLKE=;
        b=jez1wBLyEJfLSWk2nySlz1MUQPFi3Snh+3+10JAXBiBE7qCviRUywWMg8qDAoB2+yY
         5Jj6zcXjYTwpgy7ylJOZtWGpXUjGNMkrCKbDhEV3cCloDTiJ43osN/qymrSGCjrBQSXQ
         pCSOSn9/7hY5992xY1Epuq/2RH4uRFUq4u9TVY42PNJl2xyiCFulJlqMUUsRJJFPLJeo
         FXOa4WiwEjzOl0yNXDUM2R5/kvmDEbf+Uj//1QmwlWDDZ/m4MALjZ7XjidowMYB4psjF
         IKMRXhT0AYfMJW2I6ZU61LZpCzPRrUKoD0olrmDizUiBH7gQMdpIrgSOh0G7tBY5dX84
         oZDQ==
X-Gm-Message-State: AOJu0YxXrJHSDGvETahPX+fYgFJfpEHYhRHU+Q3Z9IjEojfkIKrrrFLH
	Dx9gSYH5V9vzMCKx2+iGx0CSpN5QEO84J/15+dI=
X-Google-Smtp-Source: AGHT+IEJQ/UnswWklefCzgEHvWHAJOerPe/H2CzyND+TNL/LPrnmDHwD+//eG8lI6MC/fhA9o6DMv8wR+lP5bYqvsro=
X-Received: by 2002:a0d:d605:0:b0:56c:f0c7:7d72 with SMTP id
 y5-20020a0dd605000000b0056cf0c77d72mr2225622ywd.4.1693537523953; Thu, 31 Aug
 2023 20:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1693474728.git.zhoubinbin@loongson.cn> <bf09b11ec6a0102f85dc2b3289d003271304e24d.1693474728.git.zhoubinbin@loongson.cn>
 <20230831-ambition-refusing-08e63b345573@spud>
In-Reply-To: <20230831-ambition-refusing-08e63b345573@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 1 Sep 2023 11:05:12 +0800
Message-ID: <CAMpQs4JbUx9N4MmfM6vRsdQBHyUcU9UHGX23UewL5Matt6iXnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] soc: loongson: loongson_pm2: Drop useless
 of_device_id compatible
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Thanks for your reply.

On Thu, Aug 31, 2023 at 11:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Aug 31, 2023 at 07:43:13PM +0800, Binbin Zhou wrote:
> > Now, "loongson,ls2k0500-pmc" is used as fallback compatible, so the
> > ls2k1000 compatible in the driver can be dropped directly.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/soc/loongson/loongson2_pm.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongson=
/loongson2_pm.c
> > index 796add6e8b63..5ffb77afd9eb 100644
> > --- a/drivers/soc/loongson/loongson2_pm.c
> > +++ b/drivers/soc/loongson/loongson2_pm.c
> > @@ -197,7 +197,6 @@ static int loongson2_pm_probe(struct platform_devic=
e *pdev)
> >
> >  static const struct of_device_id loongson2_pm_match[] =3D {
> >       { .compatible =3D "loongson,ls2k0500-pmc", },
> > -     { .compatible =3D "loongson,ls2k1000-pmc", },
>
> What about older devicetrees that do not have the fallback? Aren't you
> going to remove support for those?

This driver was just merged in during the v6.6 window, and no release
will use it until now.

commit 67694c076bd7 soc: loongson2_pm: add power management support
commit 6054a676e969 soc: dt-bindings: add loongson-2 pm

Of course, it was our mistake not to make better use of fallback
compatible when submitting the driver, and we hope to fix this mistake
soon.
Also, this driver will only be used by the LoongArch architecture, no
need to worry about other architectures.

Thanks.
Binbin
>
> >       {},
> >  };
> >
> > --
> > 2.39.3
> >
