Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBD815
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D37FC341C8
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658839650;
	bh=d74cZP/CLvF8iPnrOIjDZgciTCs2Z6bbBJZzGoCh0C8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=npzwcijg1JCexDNGULX73WQCG5jKdx6oJ13TGqnw14J5NJ2CIZ5UjNUorevgbwRCW
	 cEczI5+0kdvOqP6bN58VKN7vyS5yH+bJHYix0se3K/lNY9B5L4bip2JKf7FRhoMVzi
	 BgoCInIDd30rF4uLtW/kD9YVsEDEsY+wPTi3iTPTfL/S5rke5DLBqiwME2sduEiUs2
	 btVuRLbn3NXJ4LNSIMKBwpFbJvUusev8XvGzWbNyIY1dhRtk4845H4VT++ImwJ8ueU
	 VT8xPx6YITo4Hf1EpSGJm1fyyccJuCe7D9UBtKpaWMV9whStQPRe4kl3OOJ/WCqoDK
	 bTUih2uB4gBIQ==
Received: by mail-vs1-f46.google.com with SMTP id k3so10137151vsr.9
        for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 05:47:30 -0700 (PDT)
X-Gm-Message-State: AJIora91VKCX+j4J6fYSOkKnsnIFzTLW/u4uPoRsRCatmHWISa0rrg3O
	cyyzUFnv8qzTehcNuvpznTgjHT4CrV5HKm8XLXs=
X-Google-Smtp-Source: AGRyM1uEoYaT+pAFsJ0AotY9KC5NfRilcfJs6t4KnSXZnZbto4PdhjwfxktDcN3iGgu8lwhCUU09ObVBUumsLSF/saU=
X-Received: by 2002:a05:6102:dd4:b0:358:62b5:20a6 with SMTP id
 e20-20020a0561020dd400b0035862b520a6mr2471664vst.84.1658839649280; Tue, 26
 Jul 2022 05:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220726122920.2291947-1-kernel@xen0n.name> <20220726122920.2291947-4-kernel@xen0n.name>
 <CAAhV-H6Q9VNWBevwA-ekv6KfZ5okck+Q9XONNCv3THTwSAhGUw@mail.gmail.com> <53ce5f33-3c47-8c1d-b7d6-62e59aad812e@xen0n.name>
In-Reply-To: <53ce5f33-3c47-8c1d-b7d6-62e59aad812e@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Jul 2022 20:47:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6xWrVN0hOZSknunHs1zttO1e+9vu4hr1R=gmDVMrWs5g@mail.gmail.com>
Message-ID: <CAAhV-H6xWrVN0hOZSknunHs1zttO1e+9vu4hr1R=gmDVMrWs5g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] LoongArch: Remove several syntactic sugar macros
 for branches
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Tue, Jul 26, 2022 at 8:43 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/7/26 20:39, Huacai Chen wrote:
> > This patch should be the first one or the last one, why it is in the middle?
>
> Maybe in my mind the order of the patches doesn't matter (except for
> probably the cmpxchg.h changes that involve neighboring lines) because
> the changes are independent from each other?
>
> To save everybody from email churn, you could adjust the order yourself
> when applying this series. Either placing it first or last is fine for
> me. Sorry for the additional work.
OK, I will adjust the order.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
