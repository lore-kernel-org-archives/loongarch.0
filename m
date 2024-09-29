Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED936D
	for <loongarch@lists.linux.dev>; Sun, 29 Sep 2024 01:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727571765; cv=none; b=WKUkbtUFjiJe3qLb3OLlYxsW4bhsNhdMo/5FKQUd7XrLf2KSzkfLOhbZ5fO3JQMVh6YLGP9Ko6j5Yab8H2uUsZwTFFPZXr/95qjVxmSwrB/uRZKPJlAk1hUlLgSZI7XrO5eR5q6jnYet1koSSSKRUwadLUsZel/4rUA8u4SNwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727571765; c=relaxed/simple;
	bh=Pj0IxshIJH6Bggjnx49qbtJiJxEhuYQSEgzZl4oKhS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=furQ1xj5vwURBvHAdWWHwURrzdBIKqb0DEP5m4m/ytTbx8B8SOapbxDdjmWZ9aBdKHrEeG+IrRHvV5SLO145w805SS2+WCWYxYYKjMC4148bYC9lRUmiGn7xXg+xFi3UYaWI+NtzN4a7QFDi4xmrPJvK8hD74fmizKIPOfip8x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xwfki/Mh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xwfki/Mh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80294C4AF0C
	for <loongarch@lists.linux.dev>; Sun, 29 Sep 2024 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727571764;
	bh=Pj0IxshIJH6Bggjnx49qbtJiJxEhuYQSEgzZl4oKhS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xwfki/MhV+NFusCevh6/X8WDjnXeQRxIR+09rWdRW1FrmaGYRtCY/2iASS/4J9ZaO
	 0bdxoMt4Q80YdOU9kv7Drf6hCm7znKfegstHcDL6XcOwKdoJdEaAGlCDvt7lYOqOG/
	 qXTfqs9XJW8dYrR4dUx10D6R/QVSI2T+Ma4hcXjmg4KvkBoBuH3a9WvZFyWKHgByB7
	 wjqvzYSeTsm89f0fgcqkaEnu2C8Ts4fS6zkjUQ73pjDWk+xsllfbYapl214HQ89qmj
	 4VBHfjzYgTBQ89IOG8c7G0S0p6CKhQrKO5TfDRPAY1AuznowBXiF9zv/PIXm78IRHQ
	 9U+ryU9cUntfA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a83562f9be9so351072966b.0
        for <loongarch@lists.linux.dev>; Sat, 28 Sep 2024 18:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2ChzyeygUwQNoU4CbBKWXjhCTLC1R6pfu/8BfGaaXNw3cLiZNtok100qWvWLhvWD931QItXlkrd8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJyF1d1Apxns9xegpBN3JrV2SAS3lCpPVFe4m0MzCmmm7vApGn
	V/HNKrXJLS0bJYMBQaAtOGTY9BnkvdqoroN4Ee9FtinL6K/F1isl2JjjGrvjEDjmbRWptFlmYX0
	hmMCog4rev/fsy7JMRO08J7FwByg=
X-Google-Smtp-Source: AGHT+IFulUaiTzbDzWhIekoRSyHL9cv4w5EfjVkBn3/A+jBxIi5vo2uzOBESt2XlGAwVDBeydtr2ZzrttRMogE4v5Oo=
X-Received: by 2002:a17:907:86a5:b0:a7a:b4bd:d0eb with SMTP id
 a640c23a62f3a-a93c492185bmr769522766b.24.1727571763077; Sat, 28 Sep 2024
 18:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72mHQ0eKJoZeRxB5h1eHza8nERA_DtWUMKecyQuivH7SXw@mail.gmail.com>
In-Reply-To: <CANiq72mHQ0eKJoZeRxB5h1eHza8nERA_DtWUMKecyQuivH7SXw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 29 Sep 2024 09:02:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WLByJ53oqQgEnVjy4bT0pS77fT5BA4NaCp8AOn+cyJw@mail.gmail.com>
Message-ID: <CAAhV-H4WLByJ53oqQgEnVjy4bT0pS77fT5BA4NaCp8AOn+cyJw@mail.gmail.com>
Subject: Re: stable-rc/linux-6.10.y: error: no member named 'st' in 'struct kvm_vcpu_arch'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Greg KH <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 8:29=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Sasha, LoongArch,
>
> In a stable-rc/linux-6.10.y build-test today, I got:
>
>     arch/loongarch/kvm/vcpu.c:575:15: error: no member named 'st' in
> 'struct kvm_vcpu_arch'
>       575 |                         vcpu->arch.st.guest_addr =3D 0;
>
> which I guess is triggered by missing prerequisites for commit
> 56f7eeae40de ("LoongArch: KVM: Invalidate guest steal time address on
> vCPU reset").
Hmm, please drop the backported patch "LoongArch: KVM: Invalidate
guest steal time address on vCPU reset".

Huacai

>
> HTH!
>
> Cheers,
> Miguel
