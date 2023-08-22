Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0171FD0
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 15:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AAFC433CC
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692717072;
	bh=WKmDFaA3e4nvoaAQVOOLYIYZVs9ElWoCmAdZTKJpBoY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UFG4y38wWBMmq6MElEpkPwcKNyJwuji1p0HD08hIt1Yu99lzSnQbSelNJWANfBxwv
	 +qkThCwX3hRUHOA35/0MjK9anRl7tLjE9KZ84ga8TZyMmJuqs3BA8lQRfvEBOeELyz
	 rVjP8MKhQWzfOznR7E3J///2BtVSCpT7bJchiFgd5FpAxtYUsbvOcJ8+mL69HR5RGZ
	 BFZXFHjlJtXeM5ZM3/IszywqVUY90ddcsO4gHMksVJ6aDlgo7Zppn8ekz/As4Vy+Pv
	 2fBiI0Iu0Yg82BXiDo1LzEeHR2eFY5+y7IvS1DFbCfsnGIWZnuiTmf3tgHzkWP6MJM
	 5Y+7goBVNFFjw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso610336766b.1
        for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 08:11:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywd8XYM4PzmOtwUCHHubXzWgskkzX5QvmEvokVaGO3I+MPqU7uW
	Ub/4j7t2hlTNA23jE+obehj9XNa6AYNgFy58eJc=
X-Google-Smtp-Source: AGHT+IEuqtIz3e15nPmDdZ2WLoF+rkypccXXnZaPdUGS0EurK3jhPhpENVsSjGddmlcWDyqfInnmYfl4tJqd7VqbUNw=
X-Received: by 2002:a17:907:75c4:b0:99b:f4b2:6f13 with SMTP id
 jl4-20020a17090775c400b0099bf4b26f13mr7529943ejc.1.1692717070380; Tue, 22 Aug
 2023 08:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692694595.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1692694595.git.siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Aug 2023 23:10:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pCdHn63c9N5oL39ja2ZPB9+v37D7exhaoW3m+FsPL7w@mail.gmail.com>
Message-ID: <CAAhV-H4pCdHn63c9N5oL39ja2ZPB9+v37D7exhaoW3m+FsPL7w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] tools/perf: Add loongarch cpuinfo and fix build warning
To: Yanteng Si <siyanteng@loongson.cn>
Cc: acme@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this series:

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Tue, Aug 22, 2023 at 5:32=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> * LoongArch and riscv don't have tools/arch/xxxxx/include/uapi/asm/mman.h=
,
>   let's modify the detection rules.
> * Allow to use cpuinfo on loongarch.
>
> Yanteng Si (2):
>   perf/trace: Fix mmap_flags for archs use generic mman.h
>   perf/tools: Allow to use cpuinfo on loongarch
>
>  tools/perf/trace/beauty/mmap_flags.sh | 2 +-
>  tools/perf/util/header.c              | 2 ++
>  tools/perf/util/svghelper.c           | 7 ++++++-
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> --
> 2.31.4
>
>
