Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A87C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:45:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so2775977e87.2
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508755; x=1691113555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yyz+QOPnTCmJDH2mcI7Jd4URwi0CMO5PT6P34rUHZc=;
        b=eUczXDLCXgtgG1jVtwtgDgj9HtNPXbYz69ZipKt6Q1D9mp0tcHF+vL9BeGSgVxujR0
         CY7uUhgcXH3aJ7SiZre9jqU2/vrOb5sYvZ0qM4ffgV56O9YHlo015wykg47gzvalNoXD
         /7/4qdbHl29Sdjd/MajN4SlPP12eg0q5ECt50OqycuFpMgVx6O0l/xEgsALYKZHe3nk2
         d4crzOjUeAxutQwb++UJQYgJ1dziKyLgFy3XE6Iz1dmgiulhDgGk85qjqo7atCucPIvN
         sEiSubmvjFXHsUiYUZ7s06O0eRzUQgZDPtHQpD3TO3B5s0cXLHsTx5Epfeer2go8UlYR
         myow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508755; x=1691113555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yyz+QOPnTCmJDH2mcI7Jd4URwi0CMO5PT6P34rUHZc=;
        b=TM853F1tPVgez3UoU+sMF0nZNCBucZMHOgtSmuxDyJpT+/jNR+MN++DhhcY341MAtl
         G4878NhxyI7K/LuUsNVG7svTBXD+X/+VxLFBQeWgXMV1CVmDWrDKv+TPPFg6jF4XttTf
         7V49J8mamA+alLE9rBBZrqVebF+QrAahjV38SXJnze0WkJbQIpE7cnlIlVUZF09/B8OL
         11+m1ca/BFCROaJLQUbzz1c7xv6W04YpapUkVY/zsGPV4GsMYq3LZrNYRjNvxer5l6Wr
         H/XvJOeMiuDRo/FnF7+rA03H7tHTecHmpfTeGVACAyGszL1cr+OIF+ctCVLbExWwPtT8
         9spg==
X-Gm-Message-State: ABy/qLbrAgm1HUXzVhhcz6GoJxxo7MeJSNRVfZvsc5LcA37Gihgxvf2y
	AXx5w2C6V5y8lUCen9EX9L31sit8fX8J0M6Kf64=
X-Google-Smtp-Source: APBJJlFTX51B17BAYAKagPQdYNaJLvIRaYq5TT3/2yqQbBl/G5EanVIn7evMpSOeq/634KLkr4sgPP8ZA3mX0/AU73s=
X-Received: by 2002:a05:6512:ac2:b0:4fb:9631:4bb with SMTP id
 n2-20020a0565120ac200b004fb963104bbmr704018lfu.11.1690508754561; Thu, 27 Jul
 2023 18:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <a752f67c6cfe481a2329f1f4b477ff962c46f515.1690439335.git.chenfeiyang@loongson.cn>
 <30e8518e-4862-4aa5-afda-2f511dde2b44@lunn.ch>
In-Reply-To: <30e8518e-4862-4aa5-afda-2f511dde2b44@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:45:42 +0800
Message-ID: <CACWXhKkYY_g6Eo3G3TVT-AzGRa-HP2fTu9biQ6OtpPh7_hh5HQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] net: stmmac: dwmac1000: Add Loongson register definitions
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 5:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  /* GMAC HW ADDR regs */
> > -#define GMAC_ADDR_HIGH(reg)  ((reg > 15) ? 0x00000800 + (reg - 16) * 8=
 : \
> > +#define GMAC_ADDR_HIGH(reg, x)       ((reg > 15) ? 0x00000800 + (reg -=
 16) * 8 * (x) : \
> >                                0x00000040 + (reg * 8))
>
> please give x a more descriptive name.
>

Hi, Andrew,

The x is now related to the dwmac_is_loongson flag. I'll try to use
another method.

Thanks,
Feiyang

>        Andrew
