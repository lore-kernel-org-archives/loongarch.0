Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5411CA7
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 09:39:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so862976e87.3
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796398; x=1691401198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERFDOKkkrmVzc/iH5Nu4Hb+mXBiAhhvaFu2p7HjWgC0=;
        b=CeC+nM5B9xACasW8Q1RlNGMfSHq4MdON67L27cse0wHK70DQzXqrjYVprXyhvfLrww
         9xWxFFnL/7fItKCHeG+fOzjyhViMm/gwQV+Q9iRSic/vxTEiMdaSjCF0dgb/GCqfzR3B
         8unnsh8WwBUs1EUmKglOYMTzd3TrwNuOAua7d/tg+NRW7Hh7eZC+O0DoRuF+hRqK1tPG
         ESVma6h9DPxoeKYIvGsZy4bRY/zudZcLOoHeFFWyDBocVJ01D2b+zSWn1e1P8Jt39sPa
         bx6z5aVX7OucRLwLXXDxo5uq4J9Ie/Y8eAksI9KayaBG1G2rcEw4s1SIy9b70sUkIK0s
         J0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796398; x=1691401198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERFDOKkkrmVzc/iH5Nu4Hb+mXBiAhhvaFu2p7HjWgC0=;
        b=PcYrG1SMWgwltcCMpuCa+hcFdZG31mb+rDt4f20OmXudt4G0n65uXo+IyePTFJ6RP1
         TI9YoB9LMKPuUokq32FBHlDDqPcNWXviKfnrv+EQIIixDsf3RYxo7DY1Pyg649ZFbn7S
         9FOVmPiPiB9PD0KShl8/7BNcN7m+dITxO4hr9MSYL+D9AOnfqI49jSQz2vACz2TEaAcR
         wdCvN7IztHHSPsuyAE7Fa/RK1b+wyzdI7/660Q97Zd2NJJZrcnO5SVF8Ask4zemKu7Ng
         HIV9k+YfMaE7lqVO7DDzrFYuByJPGYE0vcJ/sEmSFrU/6Lm1sfz6hpD6AuRiVhMghdhk
         dpBg==
X-Gm-Message-State: ABy/qLbJdzzt5B10VRpUPVte4YYyxqBV+POkMN4dg8zuxlanKdg/hnYU
	KkLUcDy3vQC+d+DtOI7reysRT0sAMNGwUdepmUY=
X-Google-Smtp-Source: APBJJlGbrAnjHtd1gkuDBjmX8U5Q+n3M0g9kqH9jqa6LW2C+omYyP8BvFoF7s5975gvKEBRQ1Vrm2aIdvYArr/eCJqQ=
X-Received: by 2002:a05:6512:3da0:b0:4f4:c6ab:f119 with SMTP id
 k32-20020a0565123da000b004f4c6abf119mr6502952lfv.64.1690796397556; Mon, 31
 Jul 2023 02:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <a752f67c6cfe481a2329f1f4b477ff962c46f515.1690439335.git.chenfeiyang@loongson.cn>
 <30e8518e-4862-4aa5-afda-2f511dde2b44@lunn.ch> <CACWXhKkYY_g6Eo3G3TVT-AzGRa-HP2fTu9biQ6OtpPh7_hh5HQ@mail.gmail.com>
 <64ebd141-87ee-4186-9b4d-0705402c9e89@lunn.ch>
In-Reply-To: <64ebd141-87ee-4186-9b4d-0705402c9e89@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 31 Jul 2023 17:39:45 +0800
Message-ID: <CACWXhK=Dt1WW=7HmgsYVXVB4SCB3_Cu4sUYQtC-0CWdjB7wj4A@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] net: stmmac: dwmac1000: Add Loongson register definitions
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 4:44=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Jul 28, 2023 at 09:45:42AM +0800, Feiyang Chen wrote:
> > On Thu, Jul 27, 2023 at 5:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > >  /* GMAC HW ADDR regs */
> > > > -#define GMAC_ADDR_HIGH(reg)  ((reg > 15) ? 0x00000800 + (reg - 16)=
 * 8 : \
> > > > +#define GMAC_ADDR_HIGH(reg, x)       ((reg > 15) ? 0x00000800 + (r=
eg - 16) * 8 * (x) : \
> > > >                                0x00000040 + (reg * 8))
> > >
> > > please give x a more descriptive name.
> > >
> >
> > Hi, Andrew,
> >
> > The x is now related to the dwmac_is_loongson flag. I'll try to use
> > another method.
>
> Rather than 'dwmac_is_longson', make it represent a feature of the
> MAC.
>

Hi, Andrew,

OK.

Thanks,
Feiyang

>         Andrew
