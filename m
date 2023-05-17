Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1798830
	for <loongarch@lists.linux.dev>; Wed, 17 May 2023 07:41:53 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3f610c11472so1593481cf.0
        for <loongarch@lists.linux.dev>; Wed, 17 May 2023 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684309312; x=1686901312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt8vcqfcBcSzFv5CqI8kXtZUiisqmIiLAVfG/Z4B1wo=;
        b=gNAni+aefYGCbzXJZ1KCoFg8ZVjbrHwK7u+sKWIsmjjGqQJ2bWNPSg+WakHJQVS3ab
         Bp5bqMntw1uQkVw+IN1lOsU4BFRNTNuMiq9ef5c1RW9TLIi66HUQpNRoz99rtQztmRGD
         KYnmVtSd+sNgymFummMsYYEpskLLZBxJnmkacqEQxSIDH8jjQDIifWpfH9ktAgm+tMoA
         l5xZHrVJnxwv1lhnl/gXppJABX//LI0ugS4VIj2bunZX7U1ejXCSJwy/Tf02yZh0TYX/
         2qa/8Rhqzrv1gtxn/rhiuEfjmYRrH3Jk4TsxNllrNjP6UscF1wHGQheDYKzJXyF9J7W6
         2Wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309312; x=1686901312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt8vcqfcBcSzFv5CqI8kXtZUiisqmIiLAVfG/Z4B1wo=;
        b=JS2ZSpqnkRCZWjnvFOdVuNRdZtN5xjaJBOyChPIQqeYKtxL9fJ9tAqogQ9hOiqHJU7
         f7uUZSIk4stF5JdmELnMYm5hh09ETEK2O0eMx3xFwAqeXY4wQZwOofxDD0mCz+YNi9ih
         xYQeowWwaxv0Z3nIJXPKXTuTX7ViJQIJnkWiU5ho49cg17tuNQPAVSJDJqNkwfrwHu+1
         O6nAFaYer66V4andgD/ds+hsdMLrLmlS9SYoT52iUYJDrDyYkVYp2p9XLwVakrVyXNPz
         qW/wXDZVyOeO7iO7++tJZXAPt3k+gH2gbXKomRrKWwJhpPe5FG7J2nRWgFJZpKS34eBu
         xxqA==
X-Gm-Message-State: AC+VfDw3evfr3fpKZLy09qswVm6b3Bm8Z/R0PrGyHHCxWaKsr3Gf3/Ys
	x5Fr3AU+GeOSE0qtinSF+IWDzpp65oK9DGWv7EE=
X-Google-Smtp-Source: ACHHUZ74fvUaQLS0H9Z1NeDqPl+csekVSshwiPDecXWRaUqETx8dIFlUfbpRHpQ/LDhjlhXM7ONSaWWLwZCTLV0Bubs=
X-Received: by 2002:ac8:580e:0:b0:3ef:52ac:10d2 with SMTP id
 g14-20020ac8580e000000b003ef52ac10d2mr66678755qtg.43.1684309312426; Wed, 17
 May 2023 00:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230405141710.3551-1-ubizjak@gmail.com> <20230405141710.3551-4-ubizjak@gmail.com>
In-Reply-To: <20230405141710.3551-4-ubizjak@gmail.com>
From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Date: Wed, 17 May 2023 09:41:41 +0200
Message-ID: <CAFGhKbyxtuk=LoW-E3yLXgcmR93m+Dfo5-u9oQA_YC5Fcy_t9g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

> +static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
> +{
> +       typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
> +       return try_cmpxchg_local(&l->a.counter, __old, new);
> +}
> +

This patch then causes following sparse errors:

    ./arch/x86/include/asm/local.h:131:16: warning: symbol '__old'
shadows an earlier one
    ./arch/x86/include/asm/local.h:130:30: originally declared here

This is then visible in all kinds of builds - which makes it hard to
find out actual problems with sparse.
