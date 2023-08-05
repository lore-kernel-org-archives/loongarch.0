Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236CF17C6
	for <loongarch@lists.linux.dev>; Sat,  5 Aug 2023 06:16:05 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso4700303e87.1
        for <loongarch@lists.linux.dev>; Fri, 04 Aug 2023 23:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691216164; x=1691820964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh6SRGbJORTbe+GAilPaW6UAhKkkXC3v6kD9gFIi0D8=;
        b=O2ppzbiRiIufLekbkyXFJVNImwWXCXfDZZ7A/asBFIyTqOkzUuJN3RLT7Zk8GiGdib
         0jtCxMgMUlBOxr2FRKBPdjhWgTZ12RiM6dNOWT8yy15OSL9ym6cru3jSC75Vuur/2Dbm
         yIZCadSD9CPDDZTjhJdSRmfhH8Xbj+Uq4xAeq7lTSIxn1GO43JirwVVCK30c/MYiKNCZ
         bYtoDsKi3GTmGyEWkVuEv3HHAeLRlhaKh4SmIifvgijYeOipCFsH+RM65r6NRSAagnD2
         /1feQ2YOkhS0YSoOdAAozId94yKfnwSMkGcpegDja2edIEncjg2cW+l6lAUyKmEn2eYp
         uaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691216164; x=1691820964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh6SRGbJORTbe+GAilPaW6UAhKkkXC3v6kD9gFIi0D8=;
        b=HWsflTjBWO5V+JtxfQHBDeEHzdKHigwOU+ceFBWTL0j8Ivd+IU7mkV1/qMFUqUtqOp
         NM5xcN1NFbZ7L+0MgdA8dRk/Uky6MpjyDw4w3qpkFlVETxZHye1na0TF7O/cVmMCjlnM
         8m2vsNVcH/zp3xp7TIzRkPSLe2t2pYg7lHnO3nhnImmQMf+7dlR+JRQ0emwE7upbsWYw
         q255G/1jtq6AKH8OfAte+b54PJFJdvHwLBy34PObtRQ4CFOyKfEf3fbdGoVfFZ0ryKEC
         mCcU+fI2CR6eDLx5XCJZQU5pKJ/SQ6zL0H68fxDenLxAgUTcVA3cwCZxvP+5PcLpCEwN
         KVPA==
X-Gm-Message-State: AOJu0Yxgj9ePJ5MwDGudsV3Xb6v6sK+NndeR/Vs0v9scnZtSJrvKMXCD
	lzbiwtEpx/hLry58z9VnQ/zu4GmcpfKr/2V9P4U=
X-Google-Smtp-Source: AGHT+IEUBdCZnd/K1wZelx2W44FaqV4Fg0ZaSZR5Q9IiNBU6y8iF7wu6rjZT4H6nayPnFiY3lte7UyGdnssLv8qt3H4=
X-Received: by 2002:a05:6512:12c8:b0:4f9:556b:93c2 with SMTP id
 p8-20020a05651212c800b004f9556b93c2mr3247385lfg.1.1691216163857; Fri, 04 Aug
 2023 23:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1691047285.git.chenfeiyang@loongson.cn> <021e4047c3b0f2c462e1aa891e25ae710705ed29.1691047285.git.chenfeiyang@loongson.cn>
 <ZM1hwjttrnM8jFXJ@shell.armlinux.org.uk>
In-Reply-To: <ZM1hwjttrnM8jFXJ@shell.armlinux.org.uk>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Sat, 5 Aug 2023 14:15:51 +0800
Message-ID: <CACWXhKnK+iJgmXacvOjBcxn_283n4_e-7jfnZEJD1HKaJxrPvw@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] net: stmmac: dwmac-loongson: Disable flow
 control for GMAC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, andrew@lunn.ch, hkallweit1@gmail.com, 
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	chenhuacai@loongson.cn, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2023 at 4:38=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Aug 03, 2023 at 07:30:35PM +0800, Feiyang Chen wrote:
> > +
> > +             if (priv->plat->disable_flow_control) {
> > +                     phy_support_sym_pause(dev->phydev);
> > +                     phy_set_sym_pause(dev->phydev, false, false, true=
);
> > +             }
>
> Given that stmmac uses phylink, control over the PHY is given over to
> phylink to manage on the driver's behalf. Therefore, the above is not
> very useful.
>
> The correct way to deal with this is via
>         priv->phylink_config.mac_capabilities
>
> in stmmac_phy_setup().

Hi, Russell,

OK.

Thanks,
Feiyang

>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
