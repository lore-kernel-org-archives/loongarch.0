Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DF17B418
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717065686; cv=none; b=lTKzS5ER6AQi7dyh8eVpC6pfhe7iYYGKznZ52rxhJPf+93c6wtq+OoKUArtD0xB332FB0YUITIo4s0CewmWV81Whcy9i+YLyAhg1NgjtBvdDuLTTp/LyTpB2xW6zaQ1OS73ETWWXV0bMjiGW9oYEpLGgdjzibNFEwuN8trIrSjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717065686; c=relaxed/simple;
	bh=PoXLd/saRGX0CFC9ilNw4jmQaclo+pP1tMe3ZlJmqsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSd0RCW/V+9jFXxe9LFl5Bn0PRjG0MLNSJpKUYwl4Gb9akMWJqx3eOGFqD5VXBjIauH4g82AND7lT99chcE2HIoqaApNpw8j9uJABbF21TXDHzMdo3Ds7vCNS/RXzCUjq1whlPzR+qt+cQIv0HcHVs5/FnwR++5JVFatl2Zaqa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V31vltqg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V31vltqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998FBC32789
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717065686;
	bh=PoXLd/saRGX0CFC9ilNw4jmQaclo+pP1tMe3ZlJmqsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V31vltqgi+C+T2bxRbmCUtqgV4YjrmOlm9GH+DG0YfbvRKIQjwRrTEqlDmp5+icf8
	 l7T4OFJJb5CuS33UbTVdeRxRbplo8n5PvrNOr++dYVdttm4n52i/Vt3SzjD993dMyE
	 tNnz+DbNIHZtwxQ1k0LbKMnO50jJ3IR0DrBFAsvOMH2ge/J54X6NBWT/+6d1XRYSOg
	 1VkLT0tGY+jTASTcjiMXwfOsXRj0LZRbCVLzZ1pSC4y+cyDVbNJOPCFokL901ezqIi
	 zHipGN/ooJM1Ylhfvt5JFqk6+8Jlx8Hgv9K3L8unhqSFZmVVq4GaKIJORfN6gtY+1w
	 mtmEOqDh+xnug==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5dcb5a0db4so62519066b.2
        for <loongarch@lists.linux.dev>; Thu, 30 May 2024 03:41:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmrKHFCc9iMWc/H6v8XjnbWaebZ8nL0YL3tjWhZGWMWDPPP7jKYELiZ2j26dk4X9Uul/46db6hBkPKV+3Cntv74LFu7qnlktz+
X-Gm-Message-State: AOJu0YyKovLndD1hjIWHa7cXtbRYAGRACGQXD9sREJ400eRFV9DC9pP/
	6J7an4eD+zk0SDDj/h6iHErJUpCenDzCR7LVFCxGdbqu4HFhoLRQp3TYuZxfOCan0LQmjFzgMYX
	YaSIXD+E1nV10o8YyMDA4a9TaTtw=
X-Google-Smtp-Source: AGHT+IHA7kD5wmQm9SW6UKOcFzhH68w3EPz5XTex9XkYIXHJol0yy8AyvYYkuXpH4xODWkst4xhRalCPUs1dE4ij4pI=
X-Received: by 2002:a17:906:fb0c:b0:a59:ef75:5382 with SMTP id
 a640c23a62f3a-a65e8f6f478mr108011966b.43.1717065685141; Thu, 30 May 2024
 03:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522-loongarch-booting-fixes-v3-0-25e77a8fc86e@flygoat.com>
 <20240522-loongarch-booting-fixes-v3-3-25e77a8fc86e@flygoat.com>
 <CAHirt9hbzVxcKzwnSF_5jpwma+kr-WJHBQjc47ojB95Ph9SnqA@mail.gmail.com> <173627fe-3370-413b-8f9c-50c65892cef9@app.fastmail.com>
In-Reply-To: <173627fe-3370-413b-8f9c-50c65892cef9@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 30 May 2024 18:41:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4tftt3zu-BzpKvZ5vGz3rN4-rkO5uc=h3_T7JJMH4-MA@mail.gmail.com>
Message-ID: <CAAhV-H4tftt3zu-BzpKvZ5vGz3rN4-rkO5uc=h3_T7JJMH4-MA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] LoongArch: Fix entry point in image header
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: WANG Rui <wangrui@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 5:50=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> =E5=9C=A82024=E5=B9=B45=E6=9C=8830=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=
=E5=8D=886:01=EF=BC=8CWANG Rui=E5=86=99=E9=81=93=EF=BC=9A
> [...]
> >>  /*
> >>   * Put .bss..swapper_pg_dir as the first thing in .bss. This will
> >> @@ -142,6 +143,7 @@ SECTIONS
> >>
> >>  #ifdef CONFIG_EFI_STUB
> >>         /* header symbols */
> >> +       _kernel_entry_phys =3D kernel_entry & TO_PHYS_MASK;
> >
> >  -       _kernel_entry_phys =3D kernel_entry & TO_PHYS_MASK;
> >  +       _kernel_entry_phys =3D ABSOLUTE(kernel_entry & TO_PHYS_MASK);
> >
>
> Thanks Rui!
>
> Huacai, do you mind committing this fix?
I will update this patch in my tree, you needn't do anything.

Huacai

>
> Thanks
> [...]
> >>
> >>
> >
> > - Rui
>
> --
> - Jiaxun
