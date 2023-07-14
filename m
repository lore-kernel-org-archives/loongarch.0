Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF56809
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:16:32 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso21376131fa.2
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 19:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689300990; x=1691892990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4cbxLvx9uukqwC3ST3XVi//0HD0ikRNdUx1Ub10ekE=;
        b=jMTvlQrsZDr6AKA/H9kXnJZ4BZD3H+pxm0xSo2oNJPXj+DmDtBWEQqgFcvrN6UH+as
         nOIuPnE5typjxKOAy4rfJ7i/aFzSbHXltTW5kqef+gf3XlZ3m7PCbtCPu68SAK443BbR
         UjXb9J031SvOKGPzM3vEkcDKTR2iQxEhLuQRsYwJeTgkXCiCMTxSCoR0EBrahnJsvUMR
         FM+IA3iL+l40v0qU6EVDibVKJKc8KoL1i8FARTdHTt91Tm++M3cEji3eSmE298h95P96
         MgKDkAPytf4A3HiZIIDoRcrpHkrhPUSWjehWYnRJn89gcTOT5YqM8uHvpIp028bNFl+h
         wgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689300990; x=1691892990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4cbxLvx9uukqwC3ST3XVi//0HD0ikRNdUx1Ub10ekE=;
        b=SIqwoTtMsmKQxnov9YoaOT3jxFBcAOl5v7FNhLTAAc8YZZWUWXKchekty7MJumwl0n
         qEyBhaDAmmopUUSKYjAyrUszdiVwyITgmIOZV3XEH5jUtiDyyZrVRhtMUKkG7S98yTEs
         zJRri2GT4kCRCHajB68coKtCwRjJB6txFHOiWi4k2D5p/K18RkoDR8AGAoAA0fJR10aD
         0n+ddjp7o3rDYWXpwmKK+EhmrvAWldXWMeLpVXJyyUGletg2eLJ1DrWXBogLGO909Pv+
         lZwFCBKcDVyMcgG0o7UO4pS5jkYu/fxJE2Xf6XIXVet6hRgqfoh2Mt4fcQgOOP47qNfY
         qATQ==
X-Gm-Message-State: ABy/qLaYfKTKuu2MrPQF80tpujB7w7BrDXbdyA9cFVt3zY5iOziXmTTk
	lFF1DLblhdxspuOC8GzVPUXzD9NcqZdCyunLBdg=
X-Google-Smtp-Source: APBJJlHIpHlJOcS+oulRd+xIOlCCQm1kL+13HmXP2W6vLtW443zx5o6D0wzT5oPeRQA9am54WYO7dv9mE72JhlFi3UU=
X-Received: by 2002:a2e:9691:0:b0:2b6:3651:f12f with SMTP id
 q17-20020a2e9691000000b002b63651f12fmr2884902lji.3.1689300990481; Thu, 13 Jul
 2023 19:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <a200a15b1178dd8f6b80a925b927d30d4e841c3c.1689215889.git.chenfeiyang@loongson.cn>
 <0ed12e00-4ca8-43dd-a383-ba6380f21418@lunn.ch>
In-Reply-To: <0ed12e00-4ca8-43dd-a383-ba6380f21418@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 14 Jul 2023 10:16:17 +0800
Message-ID: <CACWXhKnZcY+hA-QQco911G5E5Zs4MJPN+xA8iRX6BfhfgSDr+A@mail.gmail.com>
Subject: Re: [RFC PATCH 02/10] net: stmmac: Pass stmmac_priv and chan in some callbacks
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Jul 13, 2023 at 10:46:54AM +0800, Feiyang Chen wrote:
> > Like commit 1d84b487bc2d90 ("net: stmmac: Pass stmmac_priv in some
> > callbacks"), passing stmmac_priv and chan to more callbacks and
> > adjust the callbacks accordingly.
>
> Commit messages don't say what a patch does, you can see that from
> reading the patch. The commit message should explain why it is doing
> something.
>

Hi, Andrew,

Alright, I will make improvements in the next version.

Thanks,
Feiyang

>         Andrew
