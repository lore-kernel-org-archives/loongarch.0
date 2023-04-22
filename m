Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9E7F
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 08:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE05DC433D2
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682152809;
	bh=QXG5T42tVx2Zc3hVYTGfLvngOMBM37xTg5jMxu8Vaf8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a7AqHuBEPlhcjYbTcRN879W++MliDlrTizZCF2s/Gj9E1BoTkhrgLJeRPngXy/q4e
	 4OelK9oux93062WgxdisLTQyT+lrMe5ebnuhSGqVY5AsDpyizaZY0VwP5RRKFE8EKZ
	 GaKrxXSGoefp7fwXuCo4IBSz0pXAcZPs+Cazr7V+1zySLVV321BgF2Zb1fwi0YW7hq
	 oG4ecFxfQyfCll/4I7SDG3Q7uZKEFh5GlW5aMi1Qng/glKLJh++CfyAGMa0MITta43
	 5sh8V0vvd8buR/N20er94fAOF8WLLRnYt4LKnpDsFlXAT64PvN7CUAOwTHEZELV7Se
	 9q7ciAuMoUBSw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-956ff2399c9so363477566b.3
        for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 01:40:09 -0700 (PDT)
X-Gm-Message-State: AAQBX9exPE/KYu1aebAm/bA/vd2CNKinC8zR+Xih6i+40zz/Y1BafbBS
	MRwpCQ8yc00EcnQj2aQjMHtAUQOejoTkN0MYZHY=
X-Google-Smtp-Source: AKy350ZhlLgO7vpVjaH4qh+FFLlSyRoGrJ1ZfEitx2+rsb6XEzrnoseIH1kiMEU1pVxXIX+ei8CW2tuxLEVJdCRQlfU=
X-Received: by 2002:a17:906:a2da:b0:946:be05:ed7a with SMTP id
 by26-20020a170906a2da00b00946be05ed7amr4668557ejb.70.1682152808057; Sat, 22
 Apr 2023 01:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230416173326.3995295-1-kernel@xen0n.name> <e593541e7995cc46359da3dd4eb3a69094e969e2.camel@xry111.site>
 <6ca642a9-62a6-00e5-39ac-f14ef36f6bdb@xen0n.name> <f54abfae989023fcfdabb4e9800a66847c357b85.camel@xry111.site>
 <CAAhV-H7zTjSsz=e+0r-9Z0KOF-Gxr-chXnVgWo+4eNA1ptWw1g@mail.gmail.com> <2e8d357d-e006-bda8-3711-dcbafbd4c53e@xen0n.name>
In-Reply-To: <2e8d357d-e006-bda8-3711-dcbafbd4c53e@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 22 Apr 2023 16:39:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6PfjkYPYsBEzHY5i=74-tyqSHCRC65Fbz3O0Jaggypmg@mail.gmail.com>
Message-ID: <CAAhV-H6PfjkYPYsBEzHY5i=74-tyqSHCRC65Fbz3O0Jaggypmg@mail.gmail.com>
Subject: Re: [PATCH 0/2] LoongArch: Make bounds-checking instructions useful
To: WANG Xuerui <kernel@xen0n.name>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	WANG Xuerui <git@xen0n.name>, Eric Biederman <ebiederm@xmission.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 5:38=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/4/20 16:36, Huacai Chen wrote:
> > Hi, Xuerui,
> >
> > I hope V2 can be applied cleanly without the patch series "LoongArch:
> > Better backtraces", thanks.
>
> I believe it's already the case (just try; I've moved the BADV printing
> for BCE into the better backtraces series before sending this).
>
> I'm only waiting for comments from the other UAPI maintainers on the CC
> list.
You changed arch/loongarch/include/asm/kdebug.h, does it have
something to do with UAPI?
On the other hand, kprobe has dropped the notifier mechanism, so this
piece should be changed, I think.

+ /*
+ * notify the kprobe handlers, if instruction is likely to
+ * pertain to them.
+ */
+ if (notify_die(DIE_BOUNDS_CHECK, "Bounds check error", regs, 0,
+       current->thread.trap_nr, SIGSEGV) =3D=3D NOTIFY_STOP)
+ goto out;

Huacai

>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
