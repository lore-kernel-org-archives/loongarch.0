Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819C11C93
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:08:46 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so11876234e87.0
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689779325; x=1692371325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFOc8wXCTX40R5n/QN5jnRi3zJ4EfVz1XUBftc9gujI=;
        b=k6Dzz3u+unngYvZlWXAMg/7wjM26zDJELKmq670GNyLD9qen7N5jRuhLbPJWEd8v9k
         wwbzSB++iejuKh2vEbBqh23UjTRMtyFfzZNzBKxizoQOAN/7rUzllO9jfx6hpm9i2LuN
         9Q9Zph02XUxM+I6sy6fr7B0APwQ+FChwvqo+keI3xRxme5ol7xrRvx94cT5Kw6/sUh1N
         jR9f3NhPZ2LVxT0+063M+J5XrsUGkgmlkE4UoxkbrCqDuEUzhYxRjFv4M07iQOLRcZ7G
         NHP4vPu97B6hRzYa7RHx+CkPKzzmgTgN+6hwkuYOGYsuh/Ah3YBOL8UHxTVTWGQ5GZx1
         xOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689779325; x=1692371325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFOc8wXCTX40R5n/QN5jnRi3zJ4EfVz1XUBftc9gujI=;
        b=JDoV1EkBb8Ofxz3iwejBkAckXG2L/QDKlEo3HAy7+yc/7vlEHiTalSWpFFBBZA46MU
         8ibIAwksCXkt+MysCsB3l9ScWoR+rUNTuzZuHq9pFFPo2zgrFmzkopqVX9dGcXGpjpZt
         KWqcg2uV8dXe1DhPSscqNgHb5nMa6aZ+cAA3hmwtyXn2lQNmEDzT03r4iNImdPbrfsHq
         GpJ97/9pt7kPqgcq04gNZvfvgcHVymzqz14YI214cmdel4r9dFc2kmBDExFulks5CIzz
         ius97odsDqnqRzfZPK+IEYhW4h6gZzx7QNihsEE3JvrGhKP1NT7W2lMCrW4b9IRmYthy
         SiqA==
X-Gm-Message-State: ABy/qLbrdUd0Ef+Qj5gWmAb4VocOXph5sjItzXRQTIJ3JtHcncm8MvSK
	h6TdySRRAsjVetkT743FqAfcr8sKmvg0lljoeV+mCg==
X-Google-Smtp-Source: APBJJlE8s+M855VZ6L+2ujTJXYs8tsRjy3wtCPDGaQRCXcBrm84s52ygjnsO9ygWffOOJq7iw34bVREN1ZqhcJhPm2A=
X-Received: by 2002:a19:5f1e:0:b0:4fb:77d6:89c3 with SMTP id
 t30-20020a195f1e000000b004fb77d689c3mr134036lfb.12.1689779324718; Wed, 19 Jul
 2023 08:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-4-lienze@kylinos.cn>
 <CANpmjNOHL8EMP+E9w5wxMJ+PUbxYZh2DMaEocfHP1ATQn64+ng@mail.gmail.com> <CAAhV-H7Ca08Aj1y5HHUsUreOdBTQwVu=H+3nFOUjiUiq5aR76g@mail.gmail.com>
In-Reply-To: <CAAhV-H7Ca08Aj1y5HHUsUreOdBTQwVu=H+3nFOUjiUiq5aR76g@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 19 Jul 2023 17:08:07 +0200
Message-ID: <CANpmjNNKa7yevuGeOOHtABGiSxF+8GQQudf6_9-CwT4aYD=6=w@mail.gmail.com>
Subject: Re: [PATCH 3/4] KFENCE: Deferring the assignment of the local
 variable addr
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Enze Li <lienze@kylinos.cn>, kernel@xen0n.name, loongarch@lists.linux.dev, 
	glider@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Jul 2023 at 17:06, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Marco,
>
> On Wed, Jul 19, 2023 at 6:55=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > On Wed, 19 Jul 2023 at 10:28, Enze Li <lienze@kylinos.cn> wrote:
> > >
> > > The LoongArch architecture is different from other architectures.
> > > It needs to update __kfence_pool during arch_kfence_init_pool.
> > >
> > > This patch modifies the assignment location of the local variable add=
r
> > > in the kfence_init_pool function to support the case of updating
> > > __kfence_pool in arch_kfence_init_pool.
> > >
> > > Signed-off-by: Enze Li <lienze@kylinos.cn>
> >
> > I think it's fair to allow this use case.
> >
> > However, please make sure that when your arch_kfence_init_pool()
> > fails, it is still possible to free the memblock allocated memory
> > properly.
> >
> > Acked-by: Marco Elver <elver@google.com>
> Does Acked-by means this patch can go through loongarch tree together
> with other patches? If this patch should go through kfence tree, then
> the others should wait for some time.

It can go through loongarch tree. I don't think there are conflicts
with -mm around the patch's location right now.

Thanks,
-- Marco
