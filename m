Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF321A5A7
	for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 23:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qxn7n2hX"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso9467501e87.1
        for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705102678; x=1705707478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D130Haic3fJ8XBJFw+SdYFyFWmLLHqb4ygQbVbZqeRI=;
        b=qxn7n2hXbnU+d9z9ORv4YbzD72vJFQVwFqk2+TRs2R5cW0tcAz/JFt0zzf3kKyO14S
         58UjeIp7ssISb1YhCbaSuEt62prW71qPSdw075nslwNWTI1jkAHasxBoNoBYdfFKP7Fj
         A+gzB+Xb6Zx4ty/bn/XqZsEkiTdsqwA/PC1TEpNxvKVXogOzsIK3s5h0LEbOA59otZRS
         O3WlCbWD8M5iaIgGLSJxCQ72sofJ17X8eyrLcpYhL01LboSRzdz9jHw1/7IZfgEUE3er
         eKTWxhs+bbMnk2x3qMCcT2vOXz1ZsRnj4wnvgBLkJTGDTZU8KjnapER8fYLATdNnW/pc
         j3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705102678; x=1705707478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D130Haic3fJ8XBJFw+SdYFyFWmLLHqb4ygQbVbZqeRI=;
        b=YvQSusCLZMfLxNhPr4skUFogb7b5Ryhthdf/bZh5nPzFZA0v7FNyKGPArpZuwmOmgC
         Gc9/3dyw5vdhS7M8boTUlo45SRu4FIM1lJOQFiqxZoqRjg+FtVNZKlTmsvmhgSOEwdqO
         5gQ33Vi+F7d5Er+3XrmgnkowkFvvbCspLOZ7eYdHtq5cVre5iGWVOqBY0a00hB2cVNv9
         SgOfrXxYLNQ8+cNVM5p7/LJZZf/5iNSfn2LJg3OrBmykUsyEgRaVOXDMG47XNsHlUyM1
         Lg14QZJka0/+LzAe5uvQYN+JBM+VWv8VgaMLXdex+xCjIp0P7Q04FlqTmcvCZ5B7IXNS
         20jg==
X-Gm-Message-State: AOJu0Yz+pgePPSNOA0UYqo1DZHdJQisJeAuxCTS8w5devqrZF/0/nSS7
	oqrEjewcB4+P+754Zq5e/5aoGPdA4qgNx0krPrRAU61oVBNI
X-Google-Smtp-Source: AGHT+IF9VftxTlnm9TW+u2N8M7OK49IFFcQO1e0lX02zmtEMviiex02lbBZwZzubrEoSy0Nk7DdRybqXFNy0lBuXPHY=
X-Received: by 2002:a19:e054:0:b0:50e:bb4d:e502 with SMTP id
 g20-20020a19e054000000b0050ebb4de502mr969238lfj.122.1705102677596; Fri, 12
 Jan 2024 15:37:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com> <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
In-Reply-To: <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 12 Jan 2024 15:37:18 -0800
Message-ID: <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@google.c=
om> wrote:
> >
> > The z3fold compressed pages allocator is not widely used, most users us=
e
> > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > dependency on MMU, and zbud is a more common option for !MMU as it was
> > the default zswap allocator for a long time.
>
> Johannes and I were chatting about this the other day. We might be
> able to disable certain zsmalloc behavior in the case of !MMU, making
> it available there too. Once that's happened, we can outright remove
> z3fold and zbud, and have one allocator to rule them all? :)

(Adding Sergey and Minchan for visibility)

I didn't want to bring up the zsmalloc MMU dependency in this thread
to reduce noise, but that's also what I had in mind. Sergey and I were
also chatting about this the other day :)

I thought deprecating z3fold is the low hanging fruit. Then, once we
can sort out the MMU dependency in zsmalloc, we can go after zbud as
well.
