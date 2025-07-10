Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AD206F27
	for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 04:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752121708; cv=none; b=G5qHf0Xw/xfpFoZZtEa701gTN+05ARENp2ARaYN7Iape6n9ET2VWzvFkU68KNZafCgukGDZknLzkdgl0GF5+C8JhMTHj6qMyXkIY2VqPZBl+9EthiHtOKTjG5rxrDzXqVwLu1twvRMqgssSj3ZiH/VDJi/amMj1TElbRKYJPUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752121708; c=relaxed/simple;
	bh=IQGVYlYJYQOjMZdgS87ps0oaa3pWH4qQKt7nLK4PZkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiIPyGgryeZNb+wZoxR96nVsuu0mqB0UAxnTI83fWw2H3+PKjecEq/BA96ADSJlbBWcVLMV/9Jc1K+5f1aduhF5AZUYADTbHhuPca/hebjbwi59A8nOurTX868KG1pwSwkftlqsoO1ZUYBaDAri+FIan/h32aaU96QCi1oIgwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLwZDpOi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLwZDpOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041DBC4CEF5
	for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752121708;
	bh=IQGVYlYJYQOjMZdgS87ps0oaa3pWH4qQKt7nLK4PZkc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GLwZDpOiWhaJgSaqUbs+/fFiG0AUQUZopEJTfZE0lBqFEhdf1wQLWxdH3QadWvmmG
	 A0IJTqSr2ln8W8LZ8zhzNWKn9EjCzhOkZ3kQXec/LM4lDRv27hSsWXlUiSigRRjLk7
	 0YEs4eiuvcjUZ36QFELBwnm3Rta3XuBFD6xEfZyBtgcv5BDM+U3rlrtuJsdyPrOAk1
	 oiVwYYoJpVRKQlrzBxkzF4kVpv5iefMylsG42vtNi6t+0sgdvUyhVRa9ZI40NgJsj+
	 b4grmYV4AIMYpm7mCT66aHsyzJ3UmJjdqUABA68+1wEjRypxGs0SQjkbSi/+uDqwEp
	 IHCnwBcOGw65Q==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so2767664a12.0
        for <loongarch@lists.linux.dev>; Wed, 09 Jul 2025 21:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgfflSuO0bGjmWdzM348WtBP10EF9X6bg+TEqVbZRnBh0WQkGXRB40VOkd3lLGnMXiXyd/zbcircM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMFnHu2uPc4QpyqTwkDgi3G7m4p6ZBosG7YBjTOIjqNqWjwo/6
	HnB093GoX1kLbaqJ7HTYifiemeQ9S5XhoNY7ldNU/DeJvXMKemoYm/lzl5V+ahgTX/cYxWAXCdn
	hlFFtJEvlwMAA86TMFPtg6JKo/jWl+pY=
X-Google-Smtp-Source: AGHT+IGrtabaa82rPnczwQFvKJkjAGG16UDRnoTRWYQNUvwzpw8MjTGuh90o3PxeLBe+xtnrJw3mUDIJr7OiDeggHtY=
X-Received: by 2002:a05:6402:2816:b0:608:199e:df25 with SMTP id
 4fb4d7f45d1cf-611c1cb6f1emr1442937a12.2.1752121706427; Wed, 09 Jul 2025
 21:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701090449.2426151-1-wangming01@loongson.cn>
 <0561da2c-a4d7-49bb-8394-930f10880610@linux.dev> <e89f6ce6-d9f4-4744-b6a6-9a82412795a0@loongson.cn>
 <ac47ba40-0b5e-4273-af7a-a34086ae4a80@linux.dev> <d2097a44-bd1a-47b3-bf1a-d2b9d241fa5c@loongson.cn>
In-Reply-To: <d2097a44-bd1a-47b3-bf1a-d2b9d241fa5c@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 10 Jul 2025 12:28:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4p4_HncS5jc29c1yEFG-zqmxZ_DLXwTxjsT-t7kh8WRQ@mail.gmail.com>
X-Gm-Features: Ac12FXy7AgWh0z0EA3_gaEQoBl4gXufQug1w1PJfjCIA42XS4zw_VQSnSReRlfQ
Message-ID: <CAAhV-H4p4_HncS5jc29c1yEFG-zqmxZ_DLXwTxjsT-t7kh8WRQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Support mem=SIZE kernel parameter
To: Ming Wang <wangming01@loongson.cn>
Cc: Yanteng Si <si.yanteng@linux.dev>, WANG Xuerui <kernel@xen0n.name>, 
	Andrew Morton <akpm@linux-foundation.org>, Bibo Mao <maobibo@loongson.cn>, 
	Hari Bathini <hbathini@linux.ibm.com>, Guo Weikang <guoweikang.kernel@gmail.com>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Usama Arif <usamaarif642@gmail.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lixuefeng@loongson.cn, chenhuacai@loongson.cn, gaojuxin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 6:03=E2=80=AFPM Ming Wang <wangming01@loongson.cn> w=
rote:
>
> Hi Yanteng, Huacai,
>
> =E5=9C=A8 2025/7/7 10:33, Yanteng Si =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 7/3/25 9:36 AM, Ming Wang =E5=86=99=E9=81=93:
> >> Hi Yanteng,
> >>
> >> Thanks for reviewing the patch and for your insightful question.
> >>
> >> On 7/2/25 10:11, Yanteng Si wrote:
> >>> =E5=9C=A8 7/1/25 5:04 PM, Ming Wang =E5=86=99=E9=81=93:
> >>>> The LoongArch mem=3D parameter parser was previously limited to the
> >>>> mem=3DSIZE@START format. This was inconvenient for the common use ca=
se
> >>>> of simply capping the total system memory, as it forced users to
> >>>> manually specify a start address. It was also inconsistent with the
> >>>> behavior on other architectures.
> >>>>
> >>>> This patch enhances the parser in early_parse_mem() to also support =
the
> >>>> more user-friendly mem=3DSIZE format. The implementation now checks =
for
> >>>> the presence of the '@' symbol to determine the user's intent:
> >>>>
> >>>> - If mem=3DSIZE is provided (no '@'), the kernel now calls
> >>>>    memblock_enforce_memory_limit(). This trims memory from the top d=
own
> >>>>    to the specified size.
> >>>> - If mem=3DSIZE@START is used, the original behavior is retained for
> >>>>    backward compatibility. This allows for defining specific memory
> >>>>    banks.
> >>>>
> >>>> This change introduces an important usage rule reflected in the code=
's
> >>>> comments: the mem=3DSIZE format should only be specified once on the
> >>>> kernel command line. It acts as a single, global cap on total
> >>>> memory. In
> >>>> contrast, the mem=3DSIZE@START format can be used multiple times to
> >>>> define several distinct memory regions.
> >>>>
> >>>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> >>>> ---
> >>>>   arch/loongarch/kernel/setup.c | 18 ++++++++++--------
> >>>>   1 file changed, 10 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/
> >>>> setup.c
> >>>> index b99fbb388fe0..af59ba180dc2 100644
> >>>> --- a/arch/loongarch/kernel/setup.c
> >>>> +++ b/arch/loongarch/kernel/setup.c
> >>>> @@ -191,6 +191,16 @@ static int __init early_parse_mem(char *p)
> >>>>           return -EINVAL;
> >>>>       }
> >>>> +    start =3D 0;
> >>>> +    size =3D memparse(p, &p);
> >>>> +    if (*p =3D=3D '@')    /* Every mem=3D... should contain '@' */
> >>>> +        start =3D memparse(p + 1, &p);
> >>>> +    else {            /* Only one mem=3D... is allowed if no '@' */
> >>>> +        usermem =3D 1;
> >>>> +        memblock_enforce_memory_limit(size);
> >>>> +        return 0;
> >>>> +    }
> >>>> +
> >>>>       /*
> >>>>        * If a user specifies memory size, we
> >>>>        * blow away any automatically generated
> >>>> @@ -201,14 +211,6 @@ static int __init early_parse_mem(char *p)
> >>>>           memblock_remove(memblock_start_of_DRAM(),
> >>>>               memblock_end_of_DRAM() - memblock_start_of_DRAM());
> >>>>       }
> >>>> -    start =3D 0;
> >>>> -    size =3D memparse(p, &p);
> >>>> -    if (*p =3D=3D '@')
> >>>> -        start =3D memparse(p + 1, &p);
> >>>> -    else {
> >>>> -        pr_err("Invalid format!\n");
> >>>> -        return -EINVAL;
> >>>> -    }
> >>> I don't understand. Isn't it better to modify the else{} directly her=
e?
> >>>
> >> You've raised a very good point. The reason for moving the parsing
> >> logic to the top, rather than just modifying the original else block,
> >> is to handle the fundamentally different behaviors required for
> >> mem=3DSIZE versus mem=3DSIZE@START. The key lies in thisexisting block=
 of
> >> code which handles the mem=3DSIZE@START case:
> >>
> >> ```
> >> /*
> >> * If a user specifies memory size, we
> >> * blow away any automatically generated
> >> * size.
> >> */
> >> if (usermem =3D=3D 0) {
> >>     usermem =3D 1;
> >>     memblock_remove(memblock_start_of_DRAM(),
> >>             memblock_end_of_DRAM() - memblock_start_of_DRAM());
> >> }
> >> ```
> >>
> >> This code is destructive. As the comment says, it "blows away" the
> >> entire memory map discovered from the firmware (UEFI/ACPI). After this
> >> call, memblock is essentially empty, waiting for new regions to be
> >> added via memblock_add(). This is the correct behavior for
> >> mem=3DSIZE@START.
> >>
> >> However, the new mem=3DSIZE functionality is meant to be non-
> >> destructive. It should take the existing firmware-provided memory map
> >> and simply trim it down to the desired size. The function
> >> memblock_enforce_memory_limit() is designed for this purpose=E2=80=94i=
t
> >> operates on the current state of memblock.
> >>
> >> If we were to keep the parsing logic at the end and only modify the
> >> else block, the destructive memblock_remove() call would have already
> >> executed for both cases. By that point, calling
> >> memblock_enforce_memory_limit() would be meaningless, as there would
> >> be no memory regions left in memblock to limit.
> >>
> >> Therefore, the patch moves the parsing logic to the very beginning to
> >> create a clean separation:
> >> 1. It first checks if the format is mem=3DSIZE (no '@').
> >> 2. If it is, it performs the non-destructive limit on the intact
> >> memory map and returns immediately, completely bypassing the
> >> destructive memblock_remove() logic.
> >> 3. If the format is mem=3DSIZE@START, it falls through to the original
> >> destructive path as before.
> >
> > I have an idea: what if we move the destructive code into the if block?
>
> @Yanteng,
> That's an excellent suggestion. You are right. Moving the destructive
> memblock_remove() logic inside the if (*p =3D=3D '@') block is indeed a m=
uch
> cleaner way to structure the code. It improves readability by making the
> logic for each case self-contained within a direct if/else structure.
>
> @Huacai,
> Yanteng proposed a great improvement to the patch structure.
>
> ```
> static int __init early_parse_mem(char *p)
> {
>      // ...
>      size =3D memparse(p, &p);
>      if (*p =3D=3D '@') {
>          // Handle 'mem=3DSIZE@START'
>          // The destructive memblock_remove() goes here.
>          // ...
>          // memblock_add_node()
>      } else {
>          // Handle 'mem=3DSIZE'
>          // The non-destructive memblock_enforce_memory_limit() goes here=
.
>      }
>      return 0;
> }
> ```
>
> Before I send out a v2, I'd like to ask for your opinion on this
> proposed change as well. Do you agree that this revised structure is the
> better approach?
Nested if conditions make the logic unclear, so I prefer the current patch.

Huacai

>
> Best regards,
> Ming
>
> >
> >
> > Thanks,
> >
> > Yanteng
> >
> >>
> >> I hope this explanation clarifies why the code structure was changed
> >> this way. It's crucial to ensure the non-destructive path is handled
> >> before any memory map information is lost.
> >>
> >> Best regards,
> >> Ming
> >>
> >>
> >>> Thanks,
> >>> Yanteng
> >>>
> >>
>
