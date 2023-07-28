Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE657C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:40:23 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b703a0453fso24708241fa.3
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508422; x=1691113222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsvPJY+VBTqE0LdgXqK5KYxEPsSBisJ2WKCxekzzaKs=;
        b=pv7dDKN2YAyvwe/Z6xaiM4O4h7BBC87qMhVVjel1sRvA+l6IAzRioVBxIl+2/Al0o/
         ies0wyWiIYXAvRjZbD6SygS6DtXtTvW/i92x2RCbQliOEH67exqNasHFR9f8Ag0xPcQ6
         XmEoBNvtNt+ZNDNjGFs7YRTPb4lM79+MpTFWhrP2CE4n17bHEMlqnBQgxOnMTFQd3qn6
         cM5+R60YoHyPsUTaZyPqn8wTsCyNlVo45xD/68Orvm7ippbZUk493tpSSetnYl90MRQO
         pk4vev0Kak9pXNFsflJCAjCmsqfsQ/q/aZ8J+3Wf42notqYsSEF93xELkx2C6n0acxut
         W+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508422; x=1691113222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsvPJY+VBTqE0LdgXqK5KYxEPsSBisJ2WKCxekzzaKs=;
        b=Id4Rz4VKZ7cXpiLJbJgfDV52D5M8LMOOppXqjYaEtPCaPlg3h0nILCWt43whR8h4Mh
         Z61tClcMqE4R+wUvSoMAtb8JXbBBzGNRp8vxTDO/u0Ox6NJc43Pcq2YsNxy6YYUEQZRl
         T6aWGUvVp9GJ5OL30tBGs/qkEzrzMUY4ntQghUgO2Vmo+UiAkRfYCdMCo3SmYP4gSj7+
         nlzV83XANb63LuXG76ikZaWlFpX6/6PMgscceGiUdH/wh7kN8Hp4w77YZIHD4S7hpvFD
         Z/Yt0mZoMfWzTYG+5aTlRWDg0rTubMy4x9wyH7PIZjOE96EMR7FhZ44NbISt8vC7VmEm
         XVxg==
X-Gm-Message-State: ABy/qLZ7Dz9DqO9pTL9ZGXywDpGnhpNIpzYznovnWKqyF51k1D4UpFgY
	TDpZNLFihnuu9Wu6CuDOadw+eONb6N7KilMXxYg=
X-Google-Smtp-Source: APBJJlEYD4UQvSjU89/TGVCa9wtPSpfmOs96j9XdHmge3XghaWHlBFIUTdAMIoVQiZq6JZTD7lNsbVslNM5pBleJEIA=
X-Received: by 2002:a05:6512:2391:b0:4f8:651f:9bbe with SMTP id
 c17-20020a056512239100b004f8651f9bbemr708813lfv.54.1690508421447; Thu, 27 Jul
 2023 18:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <74a7f82d516836ba53edae509b561f50b441dd63.1690439335.git.chenfeiyang@loongson.cn>
 <677d06af-eb83-4e11-9519-8f3606b97854@lunn.ch>
In-Reply-To: <677d06af-eb83-4e11-9519-8f3606b97854@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:40:09 +0800
Message-ID: <CACWXhKmgO8YAaremh-cYnv3S0yrVBCBjay3=PEHd5uK_zODHpg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] net: stmmac: dwmac1000: Add 64-bit DMA support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 5:06=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Jul 27, 2023 at 03:15:47PM +0800, Feiyang Chen wrote:
> > Some platforms have dwmac1000 implementations that support 64-bit
> > DMA. Extend the functions to add 64-bit DMA support.
>
> I wounder if it would be cleaner to implement a new struct
> stmmac_dma_ops for 64 bit DMA support?
>

Hi, Andrew,

Yes. I will implement a new struct stmmac_dma_ops in the next version.

Thanks,
Feiyang

>         Andrew
