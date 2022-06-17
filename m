Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3463201
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 15:47:29 +0000 (UTC)
Received: from mail-yw1-f181.google.com ([209.85.128.181]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7yz7-1ngyAf23CF-0152dM for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022
 17:42:14 +0200
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3176b6ed923so45936487b3.11
        for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 08:42:14 -0700 (PDT)
X-Gm-Message-State: AJIora+JYRhPLyQwy0kqxSfSCmynPuKagX9th6YE7cj8M9dzEx4mgXYK
	z09lGLBEkOoFcAzbPXT7hoSYcF735IrGxbdjuUk=
X-Google-Smtp-Source: AGRyM1ukWmthpfkPr4/2y5gBl+lfiymkoEAMJBnSKg9FV3PSl6oCNkzW4sCz4lGmqPQB/NHxQLxcBDB8WkwxgVsVieQ=
X-Received: by 2002:a0d:d84d:0:b0:314:2bfd:ddf3 with SMTP id
 a74-20020a0dd84d000000b003142bfdddf3mr12471471ywe.347.1655480533296; Fri, 17
 Jun 2022 08:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145859.582176-1-chenhuacai@loongson.cn>
In-Reply-To: <20220617145859.582176-1-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Jun 2022 17:41:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1L40=P8GnuyK--K7URyrdAb4XcPJ-+HxwY4_+siA25oQ@mail.gmail.com>
Message-ID: <CAK8P3a1L40=P8GnuyK--K7URyrdAb4XcPJ-+HxwY4_+siA25oQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add sparse memory vmemmap support
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, Min Zhou <zhoumin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7v7oVsE3U7GXiy/EM9KDCnHZqymWmZfCHM/BxUXEboQogWHkxDl
 gm4lUoshO9Sms6iw31DAztWmEd60R8UXxS/+Er+FSq1sr2YjXLtOZIL0m3iWl91wLQsZqRp
 JKxw9y37hCmNI7aQ+RgNduDvk86pxFx/epekTihcdSPapg2gqH8ZV8d5ErdsM8dYcYcfOV1
 1waGIv0+BoiVHJZ0ed8IQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EUVxFt1UAH8=:WdYfhAQ5g0ZA6ft0bvkfJs
 qxf0tLxKO1Lv4QTCZ9BDM03JiXlbRpQByaN4hkAtul0nXn+X7FsN0OLI+QHmT0KcK0AG81Viq
 APr5DDCxx6Hw1WOrj7fqcpnJvJGeIzaQPjWo6PO8u4i1ghOLk76e7rWrR6OovS7lRYE3825M1
 VEz2gv2gFrt7ox+UNnqoarSMH9H+HLoIHqUc5S2IYPjiRrGnwud6qlOSObL2smGN4tc0/Dg0h
 8mbC8W6gkUbYU0fh/dsbSxk6rKghWVIvx5rnM6NUC6TtRvcx0M5OKsT8C8Tx+ncoIfJSQRDXF
 fGzDaNkswoBNYmyKnOf7Ho6qF65z+u9qDnrjikoiceUIv46Ou1CGxAGj5FGzjhb5aC5rwe6m5
 W6BsJWFtJQg1UtBPoyVMBkBrhRzauvMfAlK3zDAjwXrEm8QmyRHtZjXduGbU4eK338YEFRLQ5
 VyGD78MWXjPRoPvtplNUNFNjkcvGi/OC+h5dLNa+5tPEp+Zymhv4omBrEaes7pm724F3OYFaq
 Nkoc2EJpOpO2obKeUiKsQ8MpEVnPXKIPU6QjUmAHqRVT7kl3x0Q4Tb0sREbJ+A8p0Cir876x/
 qaeHvZU3qyiqP9bmK0ufdICq00FS8axPA2S0xOgWJu8t5P7utu6P451xSBnNalwkBJIzSISCJ
 peDZdhp1CW0H2Ql3McoAdyxTXOW+jsxKeMl6U4MTXHhQwFOOMphnquUM/LUG1aXQMKyWwMwa7
 LoHYDZ6n6FMt6lUVT35RfMoJYzh1Ml/3wkSTYg==

On Fri, Jun 17, 2022 at 4:58 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Add sparse memory vmemmap support for LoongArch. SPARSEMEM_VMEMMAP
> uses a virtually mapped memmap to optimise pfn_to_page and page_to_pfn
> operations. This is the most efficient option when sufficient kernel
> resources are available.

I have not looked at this in detail, but from a high-level perspective, it
seems very similar to the corresponding code in arch/arm64 and arch/x86.

Can you try to merge the three copies into a generic helper and add that
to mm/sparse-vmemmap.c? If this does not work, can you describe in the
changelog text why these have to be architecture specific?

       Arnd
