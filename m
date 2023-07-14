Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55914809
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:24:51 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b703a0453fso21350171fa.3
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 19:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689301489; x=1691893489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9/7mfBIOMb+0hsVybGzj7u7Q1iyZTD8c3lirpC/46Y=;
        b=U4ODQg+ob9z9R6ODl9EA8LoTWZcugc30CyNuggR1KwgPeyo/UkuYiejlm5rWtfRdJR
         t4c9g6DPxyaqkhVBxjy0y+Zr6VvnrTvQEMH4iuELrAh1rY0UwWKjY0RPFUA5DVS2HM38
         jht4I5BYurb/wp9dbAR7N9/j0fe5uB6XD3MMo1mhZbu1bWD6fNjRd4k0ojSjwUESU5zv
         zzswnWL3VKDmRRtSFnINzv4cyBv6Ryy7WJ0AizhyJuzAtHLLw5ey4YS+3TFia5T2Cbay
         pkfHV7OEw8ZlvR+gPjCSPj1Q4FJXJCGyHc5t5YJCuXV+PIBF0QB+8DvhusMz1UjMhRkl
         ZeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689301489; x=1691893489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9/7mfBIOMb+0hsVybGzj7u7Q1iyZTD8c3lirpC/46Y=;
        b=iEtkDgB7MmOUDZkFSexXkrj8/pYFZpb8x1jke1zuH2JYARTbhNxO+DKcnJYHx7tvvn
         aRbWfhkbM7IHPsiiloMLaFrMtlz2mnrWDFq2qMWWSMVMWQe/9t1ainN4CIA6VbAIR4SX
         Lck/Bi8GYSn201IsFq0/21KQ5hB35YqwneuxT7Ox5UodwLTEZ2KQXUUcYqbey6IfJPtc
         eFh45OFcYkOKKAufCEzOOHiVRE5Kwi2FjHwNIOYqCcT4FMFpugRtg1m/D9Znh+sLYANj
         y3uxq39snJyTBf0gPfAxNvDyYNzaU/viuUR8GtIvFO1MDeZg/5zdugX4RfTbO/eqgevW
         crtA==
X-Gm-Message-State: ABy/qLa9EnjDP/eqroDl0TX3z2fWtAJEN0VahaO1Cwk23XOZc/xy2+Ta
	5zgLz2soxGHHf6I71zcz0BqdPfJBEeSxRkVWhUQtolOx2uPJc1N/
X-Google-Smtp-Source: APBJJlH3CrRs4nvBhPDbsLVdh5lnDzW0lZ0uvsiYM0vGsb5/s+afJZBSYr5uQrKos+aMl17VAoQMFiViwJhYoDEa0fc=
X-Received: by 2002:a2e:8693:0:b0:2b6:dac0:affe with SMTP id
 l19-20020a2e8693000000b002b6dac0affemr3244830lji.31.1689301488784; Thu, 13
 Jul 2023 19:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
 <e491227b-81a1-4363-b810-501511939f1b@lunn.ch>
In-Reply-To: <e491227b-81a1-4363-b810-501511939f1b@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 14 Jul 2023 10:24:37 +0800
Message-ID: <CACWXhKmLRK5aGNwDyt5uc0TK8ZXZKuDQuSXW6jku+Ofh73GUvw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:07=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Jul 13, 2023 at 10:49:38AM +0800, Feiyang Chen wrote:
> > Add GNET support. Use the fix_mac_speed() callback to workaround
> > issues with the Loongson PHY.
>
> What are the issues?
>

Hi, Andrew,

There is an issue with the synchronization between the network card
and the PHY. In the case of gigabit operation, if the PHY's speed
changes, the network card's speed remains unaffected. Hence, it is
necessary to initiate a re-negotiation process with the PHY to align
the link speeds properly.

> > +static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
> > +{
> > +     struct net_device *ndev =3D (struct net_device *)(*(unsigned long=
 *)priv);
> > +     struct stmmac_priv *ptr =3D netdev_priv(ndev);
> > +
> > +     if (speed =3D=3D SPEED_1000)
> > +             if (readl(ptr->ioaddr + MAC_CTRL_REG) & (1 << 15) /* PS *=
/)
> > +                     phy_restart_aneg(ndev->phydev);
>
> This needs a comment at least, but if you explain what is actually
> FUBAR in this PHY, we might be able to tell you a better way to work
> around its problems.
>
> > +static int loongson_gnet_data(struct pci_dev *pdev,
> > +                           struct plat_stmmacenet_data *plat)
> > +{
> > +     common_default_data(pdev, plat);
> > +
> > +     plat->mdio_bus_data->phy_mask =3D 0xfffffffb;
> > +
> > +     plat->phy_addr =3D 2;
> > +     plat->phy_interface =3D PHY_INTERFACE_MODE_GMII;
>
> You would normally get this from DT. Is the PHY integrated? Is it
> really using GMII, or would PHY_INTERFACE_MODE_INTERNAL be better?
>

Yes, the PHY is integrated. I'll try to use PHY_INTERFACE_MODE_INTERNAL
later.

Thanks,
Feiyang

>        Andrew
