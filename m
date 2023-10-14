Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492E2586
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZWvF6fh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07D5C433CA
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697274556;
	bh=QMKGeVOd3CQqoQwVajdhLaEh2KmBVSf8R3WFPYadptc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HZWvF6fhPJyRBXJV6sf2vMWNoPu/ZNCKgiUmo0OQXjc/z03PSmpR6MbeNUKEdo1w4
	 m8QBx2FruJm9mxg+hHrr6iGRH1hB/t61ooXfrX8ZKg2vICkEBGpyBHJSXPP7pNVf8P
	 /Nv1p7C0+uXxUjchzbq98DaDOoQcTu9SkfzuaTJwIf6JwPx3/dmQugsWZqfDx77sVv
	 L2B3sqkAwG12YedKz3eeTDZcqR+B+eIVo06uwynAjrqQFqsVwza8dzmdhq3n5hpCxH
	 O2BHBQAx05gFteBHw94KFS986YvVFSjOlg2SRCQXiWF4MkjoSCwGINQSDuMzAldz+3
	 VCq8BYKf+YD3Q==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1e562706d29so1644780fac.2
        for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 02:09:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YxGszdsQsA0IEQ6yelANBVc28hzzkBpwCuaC9CSQjQGbrLmClnX
	Kza7h+DrfEpUqb+8xVkHXewZgSju8BaUp9aGojU=
X-Google-Smtp-Source: AGHT+IHedrA3UMSJSZgJvBvP0ejVRXx5lRC+UJuOuF1WIWquOiHBeVkX9c2aoRHTFlsXmzRC+2SAleIJLiufg2NmOCc=
X-Received: by 2002:a05:6870:a99a:b0:1d5:c417:503e with SMTP id
 ep26-20020a056870a99a00b001d5c417503emr32560193oab.57.1697274556176; Sat, 14
 Oct 2023 02:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009124210.1064021-1-masahiroy@kernel.org> <CAJF2gTQxiCEyGiGieHJMBK0Hmj49f8mdcm1TwsTZbgbvxVxGcw@mail.gmail.com>
In-Reply-To: <CAJF2gTQxiCEyGiGieHJMBK0Hmj49f8mdcm1TwsTZbgbvxVxGcw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Oct 2023 18:08:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPupf+iMNxs7gNAAm15Y1Eg8eXuZTWwVai23heZE8FjA@mail.gmail.com>
Message-ID: <CAK7LNAQPupf+iMNxs7gNAAm15Y1Eg8eXuZTWwVai23heZE8FjA@mail.gmail.com>
Subject: Re: [PATCH 1/5] csky: remove unused cmd_vdso_install
To: Guo Ren <guoren@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 12:16=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
> On Mon, Oct 9, 2023 at 8:42=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > You cannot run this code because arch/csky/Makefile does not define the
> > vdso_install target.
> >
> > It appears that this code was blindly copied from another architecture.
> Yes, I do that. Thx for pointing it out.
>
> Acked-by: Guo Ren <guoren@kernel.org>


Applied to linux-kbuild.




--=20
Best Regards
Masahiro Yamada
