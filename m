Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5433C7
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 10:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B096CC433D6
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668509793;
	bh=bUq4qF49dTSiX+YW7b/lNZ6yi6EJP0/qEUwKi93+nws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A437xAr5noIvlAdWzTELtVNYIDQRWTul071rCsV1i+Qwxm9xWBL1e358p4XBqGGH5
	 gO6aYaUZWdYiYVrWtR1x/cRk0ucb+xk8eVbtqegfl5mbFg0OvFwCXsOKslqZXXcfMc
	 xxHX4fjkvswlaAfPwm0ot2I7GYkXNM2rj/1GRkUNUUghKP0fWfPSwhLiGx/584zQR4
	 0YDpszW1SRLaMulvGk8IofCT2r9W2b0zbmv8XrglI1VW0v+ReeOgghi4CsgUPU97nA
	 Xpg3usIbEwLSsZwJLp0iIqk6SyW+BYuIe82Dt3ek2xuQ3PmTtBnDO/27jMkVVTcKFo
	 5/8Hl4pBLCA9g==
Received: by mail-ej1-f42.google.com with SMTP id gv23so2347984ejb.3
        for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 02:56:33 -0800 (PST)
X-Gm-Message-State: ANoB5pk1pLCBrmt8zNAy2y3xfZO413teg/Q+/F03l4FAxV8YRCx7kVqa
	nKFATL9stKd1V0wU4zGzmLx/QB6qZVTzlRB/vCU=
X-Google-Smtp-Source: AA0mqf6VTwMHjT149uo6jBK3S86obQLAcQ13jvn8mjV4FY+aOXZeh8zAhRuJc5RqKjjz6LWMkBgouMVX2IYQorcrwjY=
X-Received: by 2002:a17:906:ca4f:b0:7ae:5a4:5356 with SMTP id
 jx15-20020a170906ca4f00b007ae05a45356mr13603798ejb.748.1668509791932; Tue, 15
 Nov 2022 02:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221115025527.13382-1-zhangqing@loongson.cn> <20221115025527.13382-10-zhangqing@loongson.cn>
 <CAAhV-H5YnpRu=mcdmHy=x9MstTmfFgHU=WV4ZBd49PBkeeZjAA@mail.gmail.com> <2d238a7f-8e1a-4959-a6c5-e58567ace6e3@app.fastmail.com>
In-Reply-To: <2d238a7f-8e1a-4959-a6c5-e58567ace6e3@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 15 Nov 2022 18:56:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H693q0Kdvpu2ACR7nKxN13svLr3Gc0TVhuB+hAh_3eSzQ@mail.gmail.com>
Message-ID: <CAAhV-H693q0Kdvpu2ACR7nKxN13svLr3Gc0TVhuB+hAh_3eSzQ@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] LoongArch: Enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS
To: Arnd Bergmann <arnd@arndb.de>
Cc: Qing Zhang <zhangqing@loongson.cn>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@redhat.com>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 15, 2022 at 4:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Nov 15, 2022, at 09:31, Huacai Chen wrote:
> >
> > I suggest not enabling debug mechanisms in the default config file,
> > distribution configs can make their own decisions.
>
> CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS are rather fundamental, and
> are enabled in most other architectures as well. I would recommend
> everything that is needed to run on the most common hardware
> configurations and that is needed for booting into a general-purpose
> distribution, but not much beyond that.
>
> Other options like CONFIG_DEBUG_INFO and CONFIG_DEBUG_KERNEL (including
> options based on it) are probably better left disabled though, those
> are the ones with a significant runtime or buld-time overhead.
OK, got it.

Huacai
>
>       Arnd
