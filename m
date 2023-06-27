Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4C10F9
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 04:44:21 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5704fce0f23so42572757b3.3
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 21:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687841060; x=1690433060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVtrcXbE5qXWKdJhq2ArhetT4KPRpQBwbjTOuMnTdxE=;
        b=501HLYHctmk8sIJeTmzxhRx3/mgKpv1jRi1zyxe6IKd5PzvxEUvUlafEKoDqL6yZVr
         8LPzltfzYfOsnNGE3T6BklB22lAMitCgdhFuhtcXDNR8cn90bt0hxS6/rFyMCnKABSjm
         /oRswCkgkHFa78/d8yQxqLAP7w+UcywLgaNVEk0kQUj/E5gzTgG4U1Ib/QTJ68K6B1lq
         DHiArvPKR0yaKTV4AcdaFGyA0a3QVzlRHTqcAyQmjJhyBDsZIisDj9Axezm4VTj3plhb
         Dus4mDTAcMi1b8nttzH3dDwb6//iZcVcKmqu+MryYnw/GG09jfr1xcEP4Qfwx6utRJkj
         zVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687841060; x=1690433060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVtrcXbE5qXWKdJhq2ArhetT4KPRpQBwbjTOuMnTdxE=;
        b=RGKhzITNWaS6F/k3kTrkWOcWMIRXmqUPyjHyYlbysanw0mRDo+m/W4qDLwAoTcR/ut
         8HAWaPJ+kGaPudsHA3wyzD4VnFgarPu+uXkUmg6uwi1h9d56VJqGX9hOsL0Lczb8WnIq
         9FVe3uyUoKoEpbKtGfCjkj2v9SgwvGSmbCEPa3FsNuZLbCxyaBqolfz4YZYZO6O3RsQH
         X5IGVK+y+gnHC0ILDZc8wdXvMiOXPwyxB0gPjpzMVuNBQEdPy6U8Yo8eSLHLRzf9Yhn/
         dbzFLFVKDGBW7RpB5OAp8J6XcdOyCksmVTBnpVxiKS7gYzpMf8W4uNQpfVN8NRoGWBtV
         fBwA==
X-Gm-Message-State: AC+VfDy/F/G0oFxKzhFBrAEXx1vigrsYzoMRVewql9HUrR/FixlDtf3Z
	z5caxvbANcAuFQp5102nQcM8+g==
X-Google-Smtp-Source: ACHHUZ4LBcIHJ/ynOcwzWzKYI9Mk2cjEWGfgZGpKdMoBZ7/XKupPMOzNiMbSCmgeKveyN334gs70/g==
X-Received: by 2002:a81:7bc2:0:b0:56d:43cb:da98 with SMTP id w185-20020a817bc2000000b0056d43cbda98mr29864359ywc.29.1687841059932;
        Mon, 26 Jun 2023 21:44:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j8-20020a252308000000b00bf44703efd3sm1487805ybj.6.2023.06.26.21.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 21:44:19 -0700 (PDT)
Date: Mon, 26 Jun 2023 21:44:08 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
    linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
    xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
    Hugh Dickins <hughd@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
    Huacai Chen <chenhuacai@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    David Hildenbrand <david@redhat.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Richard Weinberger <richard@nod.at>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, 
    Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
Message-ID: <e8992eee-4140-427e-bacb-9449f346318@google.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:

> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
...
>  39 files changed, 686 insertions(+), 455 deletions(-)

I don't see the point of this patchset: to me it is just obfuscation of
the present-day tight relationship between page table and struct page.

Matthew already explained:

> The intent is to get ptdescs to be dynamically allocated at some point
> in the ~2-3 years out future when we have finished the folio project ...

So in a kindly mood, I'd say that this patchset is ahead of its time.
But I can certainly adapt to it, if everyone else sees some point to it.

Hugh
