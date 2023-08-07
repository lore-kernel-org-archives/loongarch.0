Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353EA2C9C
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 16:36:38 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so6118328a12.0
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691426196; x=1692030996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZNcpOl8CEiyqW/ZOb/0XcvAH0YrJ+P7c3vLK34uSAU=;
        b=p+tvWBWwjHGrwcist+ERw9YfHaq9zpl05ImB2qAvYkl732NZFX8xD9wURvjqtCVJ1j
         f5qbn/zlJNV6GNzz6n8+mAMJaBmpwk6+UVEKF6KWKUWEFm/F9u8VY8GQrgo2LxfeBZvN
         Q25ySkdvCjrYg1Bcz4X891+wn78TNlj5vCAcuaen/d9ZcFRwWOOdiM/IHn+hB+Sp5QbU
         7KEoIxqB/oC0PKxqJkad8mWMRJdrUlFbGS3ml6DKgWCGfEOr7lCPVn0QEw8jmqV+iO3y
         DCv0CWe6Fi+dWUg+QwUzhxPuhEjT/J6XbuR1v14rXzF9ymm5RSsS8aqzuc3ChKdKQDuo
         ZzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691426196; x=1692030996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZNcpOl8CEiyqW/ZOb/0XcvAH0YrJ+P7c3vLK34uSAU=;
        b=MHDyNYWu2x4Erpq8acrHiKitBjIXimY79y9mmStYcpPZaVSnG2fIVCtl54nxCTURqP
         aji6qiH0yvdjUCpKwAyGwX4BXTphPiUFKhCWwYTZQ4SMfLJ/1FPvYa11dAk41c66ML9Q
         q5Y4CPtlhkr371C0ddXGMnX9zSpzWBRDxN/vfb0EsmhBtLAxGx6uwSmJvUIsUEG8tDoe
         veWgLE1tq9cAFVZFYLu5buw2o8+MdB5MTeYP1ndOkmNbFsZZodvqUjiE8mgCeoagK5Fb
         EqihvU5lTvYqUDe/Sd6MaeoXFztNayh/QcV7+xd8m3sjf1ne7ozJwqqLf6imNAG5ltz0
         K4Jg==
X-Gm-Message-State: AOJu0YyZMs3XZqshFOAKcoziVvkQuSVn+Nor1jex+ViaGe4HjYuEb5SY
	/XqGu3sCaF4xKC98zNj8DytNS1f9jDOtKjEtPKM=
X-Google-Smtp-Source: AGHT+IG6xEN7hWZW963ar6a6y/IZv7TEMEGaFqOpr/N9QzXhbQky+esm5rTRkDEeHyn3BVgzlYOqaXCi0RXhkI/5nGE=
X-Received: by 2002:aa7:c7d9:0:b0:522:2711:863 with SMTP id
 o25-20020aa7c7d9000000b0052227110863mr9220038eds.1.1691426196109; Mon, 07 Aug
 2023 09:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731084458.28096-1-ubizjak@gmail.com> <4d4dd1e8-042a-561a-4ffc-529638cb0780@csgroup.eu>
In-Reply-To: <4d4dd1e8-042a-561a-4ffc-529638cb0780@csgroup.eu>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 7 Aug 2023 18:36:24 +0200
Message-ID: <CAFULd4YByT++kV21nZGE+ME9B2KQtQYNRz6Ar2awoLws-JznUw@mail.gmail.com>
Subject: Re: [PATCH] locking/arch: Rewrite local_add_unless as static inline function
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 6:13=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 31/07/2023 =C3=A0 10:42, Uros Bizjak a =C3=A9crit :
> > Rewrite local_add_unless as a static inline function with boolean
> > return value, similar to arch_atomic_add_unless arch fallbacks.
> >
> > The function is currently unused.
>
> Is it worth keeping the function if it is not used ?

We already have plenty of these kinds of unused locking functions in
arch/*/include/asm/atomic.h, so I thought we could leave this one as
well.

Uros.
