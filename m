Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0A809
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:16:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so2471712e87.0
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 19:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689300980; x=1691892980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2g/MXvN83ceJtO7KV0hkTCgKaz+BrPyW3/qs/kgHp0=;
        b=bZVdC6fJJOoZ7Ze/VicNX6Niny4G+QmSQTV/MEfOYqussMKjXcVq/4KFuixAJug+rX
         8V2HE+OsqtGprqWR3ROYxFLQr+PoYSdCody8qF43JwoqHtKNH/ZixC2amM8RueVn9x0Q
         e1mjth8XP8uvBxMuq+TcnsR/PcPNSIAywpOtbR0fvft1MbLTh51Ed9G5LmLuywEKSbxf
         IA1a+FBuPTpuHU/Ly5+IXNrlOu7eucOXhtZL87NhodejFhGuG2B08+rHXcAb9r5OxugN
         RKBQwWsWkIsNP6RyvnVMSuJuRuMuuL2II8JIak6rc54mt2XJA2Dh87b+GVdNMaGffo5H
         2q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689300980; x=1691892980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2g/MXvN83ceJtO7KV0hkTCgKaz+BrPyW3/qs/kgHp0=;
        b=TnK/3q0Tx8pxruK09EgKrcgwfI9QJIgeBKqgXMcWSZAG5Pi0EZXNs3EJXCuC3Dn2jQ
         ki9RRryHp28WaN0X9iCQA0ddjbbDD3hq4pY3ENMay6Y+y3OlJN3skvUu31pyniIbEzX/
         lfBqiEuVpj9zEpBNd+3z3wzsGiHlEor4nP6z1zBXLm4LRDxN67pv2BC2pxnHxGK7Mp5d
         nriSi3UApU3I3x9GELiKXnK9vSomosdM4VSE0bk1R+vjITgUWi2CG6AHLnF7z2QwPLci
         tNEcz7SkxaFvgd2hVyyiSf5KfDVOcO935L96g0Xv4z78cssfBN49+fYOcHjG0cXQRIMc
         ykgA==
X-Gm-Message-State: ABy/qLbSW4rsdnFTBLQWR3rgoAnMRVFAO9PVNR7Gn4ZSCXQQnbXLmQ34
	LNZPtEXmKYwAJDTtadLvXfAGvDfjo+wj8PzGFe0=
X-Google-Smtp-Source: APBJJlGuR/b6EZSldBIkCBY/xGs9SrtbiUUL7b5CnHkQ/yW38NhqfPbt+NmTHfy4QLROSYzwrPoxr3bw3jEqwvzIdzI=
X-Received: by 2002:a05:6512:4011:b0:4f8:5e49:c610 with SMTP id
 br17-20020a056512401100b004f85e49c610mr2875239lfb.35.1689300979729; Thu, 13
 Jul 2023 19:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <2e10d9d1-e963-41fe-b55b-8c19c9c88bd5@lunn.ch>
In-Reply-To: <2e10d9d1-e963-41fe-b55b-8c19c9c88bd5@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 14 Jul 2023 10:16:07 +0800
Message-ID: <CACWXhKkUJCFV8DKeAOGPQCfkn8mBhZvBJBMM8SYVgVKY8JEyRw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] net: phy/stmmac: Add Loongson platform support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Jul 13, 2023 at 10:46:52AM +0800, Feiyang Chen wrote:
> > Add driver for Loongson PHY. Extend stmmac functions and macros for
> > Loongson DWMAC. Add LS7A support for dwmac_loongson.
>
> Why is this RFC? What do you actually want comment on?
>

Hi, Andrew,

I marked this patch series as an RFC because I believe it involves
significant changes to the dwmac1000 driver. I want comments on the
design and any alternative suggestions.

Thanks,
Feiyang

>     Andrew
