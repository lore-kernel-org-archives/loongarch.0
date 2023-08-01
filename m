Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724F440C
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 23:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7F5C43397
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 23:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690931842;
	bh=xM9+38xkTaN7YlIeDutwYzXFMh5cVl6szD/Pylq4X8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WrzRq8qLP1GUdOwsqs5cbpqjL+mV23IX8e3uQwhDcMU7RXaeBrsr+J9mqo6FFsY0Z
	 Exi0sgw4Q0aOinGyJGU5RyBeTzFNcXV+eVTasfFRj5PK49SDxbF+GNGsSGS7leFhAf
	 7x3zBNZSxX+H3kNUtKs9BkllbkGAGec3BgF+0vBL4s9aYxJ5TMMTFgwFAeF0TOncaN
	 qX1n0F1Lf8K21aRZBl+RQ8Wqaw9s9b7KRokhbHLv4tHu0nVhXTgV6s3VsRSp5hfL+9
	 YXK+vN4dxMSPGIeOxcfVpAyHHn0icLLM/RyhEZAd0mV6D6pE5+GCFvKMNcXbNvrqcM
	 5L1qREEpa7Q/A==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-522382c4840so8918206a12.2
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 16:17:22 -0700 (PDT)
X-Gm-Message-State: ABy/qLZxDoONlJuCTG5gExipwXPB6QYAnZ74GsQUVIu70WJOgbhvgJp1
	6BAXrdE2Bt9Qh6pXceINPlI+8dIavS97VejdVF8=
X-Google-Smtp-Source: APBJJlHzSbvLp0zlo6ebxGrDPbALgU9POa6/C72klCXoxCkytUo1BaqN3c7kRdocGUEpjAyzR6c6IQsemqRni073Dfw=
X-Received: by 2002:a05:6402:1650:b0:522:216a:28d4 with SMTP id
 s16-20020a056402165000b00522216a28d4mr3598861edx.7.1690931840292; Tue, 01 Aug
 2023 16:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
 <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
 <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com>
 <CAHirt9gVqE=9vviJEY=kY=booVRmFPHrnFsKCXPXnXiWTB8bZQ@mail.gmail.com>
 <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com> <CAHirt9i_osW_Dy5jNAnNOKrm-+38qN7SF+8ofNHePMAYhRKHsA@mail.gmail.com>
In-Reply-To: <CAHirt9i_osW_Dy5jNAnNOKrm-+38qN7SF+8ofNHePMAYhRKHsA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Aug 2023 19:17:08 -0400
X-Gmail-Original-Message-ID: <CAJF2gTSLD3jwzV59dGj_RENCvE0zMOAkLHqmT55bxL-4vA1wkA@mail.gmail.com>
Message-ID: <CAJF2gTSLD3jwzV59dGj_RENCvE0zMOAkLHqmT55bxL-4vA1wkA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: WANG Rui <wangrui@loongson.cn>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 12:37=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> On Tue, Aug 1, 2023 at 6:50=E2=80=AFPM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Aug 1, 2023 at 5:32=E2=80=AFPM WANG Rui <wangrui@loongson.cn> w=
rote:
> > > No. LL and LL won't reorder because LL implies a memory barrier(thoug=
h
> > > not acquire semantics).
> > That means we could remove __WEAK_LLSC_MB totally, right?
>
> More precisely, __WEAK_LLSC_MB is intended to prevent reordering
> between LL and normal LD used to fetch the expected value for cmpxchg.
Oh, that's unnecessary when cmpxchg fails.

Maybe you treat cmpxchg as a CoRR antidote in coincidence. Please
solve the CoRR problem by READ_ONCE.

See alpha architecture.

>
> Regards,
> --
> WANG Rui
>


--=20
Best Regards
 Guo Ren
