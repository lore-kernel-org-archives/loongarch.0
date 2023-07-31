Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3AF63A2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 09:47:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f954d7309fso5320714e87.1
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796829; x=1691401629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJWnYrFQOvRUTU9QJb5JhTI9ZcFNM0nZZtsPRcg4gpo=;
        b=DH4sS0q5aYKbJmVkzW6i+EWE/yfNEx3EBvMtuTVVhoR+gf2M5oK8ubei4xQQ6UcE0J
         ncX/SY9y5xRKeEev16EVaPc/uIjsDy6GulvxU+4Z9pd5fzw71aoCOZnBHJYPm3/mkLqU
         /N9KKOR05eSHsXkJSZi9FO3oaC4sFREg6y/nXzsmqBuSM2vtGLWbMna2bGGKI9a79tIg
         llrxspzwuzrPofIfC5Tj72fIl96NktmKasZpE1hV+l+C68Bx5f23Z4dpsyJfElfCgOEh
         yUYWhUDDEwaPgpz5JW9qM7kg+3yc3YiMvZn0kFwNr1RY6Php0DlUSBKMjasGAAzkauJO
         /YiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796829; x=1691401629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJWnYrFQOvRUTU9QJb5JhTI9ZcFNM0nZZtsPRcg4gpo=;
        b=UPnlIeBNSIU89YldhSybVjPUx/iQ0KGH6IRLMhmQURkekyspxsr9cs2K+sbYwApsiR
         6tL2Ywfuq9pOumO9zXoGHgeWMqRRPPbglN4afDc2y65v3fyIu93iqXp6PtzhgNRfuQo9
         Ckp3Oyhg4YCIiuWnUFUsE6vZksEqZh8mGLl9XJZmKSqyR/+7+M+aVFbeFFxbFrZw3j5l
         5PaNYltWWt04bPGDXfL/EU5iVM0mtQ928p+S8OhrCPB+Vtf/mX2S+20c14fx0nB29UXu
         rrtgwRQwTaszMnb8LB7EajPW0FwnGX7JuR5JHC8ROZr4Phfx87YZJbOZ3dAHEcWdnRyc
         yUKQ==
X-Gm-Message-State: ABy/qLaBXxJByANaSAS5bMPpvyUnrjH22D/IoTAvwkWJZ2J60gjf9X0m
	202qgiB28S4Yw2culXlqmEwaeSkBI0V3A6btcdU=
X-Google-Smtp-Source: APBJJlHB2qbVzGFshPeg+QG1pL6JaDBFsvmiAnAnm1yEtlVjYWe4Aa3OGHhWJErglPDD3XVa0X6EHm2xXrKIC0lAahE=
X-Received: by 2002:a05:6512:304b:b0:4fb:8aca:6bb4 with SMTP id
 b11-20020a056512304b00b004fb8aca6bb4mr4401427lfb.20.1690796829500; Mon, 31
 Jul 2023 02:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <7cae63ede2792cb2a7189f251b282aecbb0945b1.1690439335.git.chenfeiyang@loongson.cn>
 <ZMOJNtClcAlWwZpP@shell.armlinux.org.uk>
In-Reply-To: <ZMOJNtClcAlWwZpP@shell.armlinux.org.uk>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 31 Jul 2023 17:46:57 +0800
Message-ID: <CACWXhKmcFCHQsjc-7BU5VkNyJ70v6iEg2iQ11i-qS3VchvKCJA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] net: stmmac: Add Loongson HWIF entry
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, andrew@lunn.ch, hkallweit1@gmail.com, 
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	chenhuacai@loongson.cn, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 5:24=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Jul 27, 2023 at 03:18:06PM +0800, Feiyang Chen wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index e8619853b6d6..829de274e75d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3505,17 +3505,21 @@ static int stmmac_request_irq_multi_msi(struct =
net_device *dev)
> >  {
> >       struct stmmac_priv *priv =3D netdev_priv(dev);
> >       enum request_irq_err irq_err;
> > +     unsigned long flags =3D 0;
> >       cpumask_t cpu_mask;
> >       int irq_idx =3D 0;
> >       char *int_name;
> >       int ret;
> >       int i;
> >
> > +     if (priv->plat->has_lgmac)
> > +             flags |=3D IRQF_TRIGGER_RISING;
>
> Can this be described in firmware?
>

Hi, Russell,

I'm not sure, could you explain what you mean?

Thanks,
Feiyang

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
