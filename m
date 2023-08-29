Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192717AB1
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 17:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A08C433C8;
	Tue, 29 Aug 2023 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693329412;
	bh=uglJZMr/rEggfPbd5Sq8n+ucNVnh5OnYWf4rm594aQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnrjRqZjkqu2MiF5EDeisPuiywkfxD6ppfgUDE6x82UySVxGyCQa1kH4ZASkcTzFo
	 sfwI2pYUKwtRX+zibS4GyB90eKahoPdHBm3cf/hiTwSslDQsWwv3D5X2h/vIIVXETm
	 HpC1spjd5rbwKogoc3hDLfvqoYGnbA3yMlmIsr9EPrNyE65rCelAFI+ZjXojeMXfVG
	 frtuArZbojcHUBYfkgwPtW+Jf+ux7GVLSjHeDu40OgMh0ZK+nNNtImzj2j5gaFp3aH
	 RprJeNG8Ws3L1fXDQIVOJtTwdmT7SwSspp8enbat4mOi4Q0LZm89XlOHf6+6QVH9cX
	 aHppdcVHNgA6A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 9943540722; Tue, 29 Aug 2023 14:16:49 -0300 (-03)
Date: Tue, 29 Aug 2023 14:16:49 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: mingo@redhat.com, peterz@infradead.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	chenhuacai@kernel.org, linux-perf-users@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 0/3] tools/perf: Add loongarch cpuinfo and fix build
 warning
Message-ID: <ZO4oAeXdSvnqdku3@kernel.org>
References: <cover.1693315043.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1693315043.git.siyanteng@loongson.cn>
X-Url: http://acmel.wordpress.com

Em Tue, Aug 29, 2023 at 09:21:10PM +0800, Yanteng Si escreveu:
> v4:
> * Modify commit message. [3/3]

Thanks, I updated the commit log messages adding the Acked-by and the
new description for 3/3 since I hadn't published this in perf-tools-next
yet.

- Arnaldo
 
> v3:
> * Using strcasest() correctly.
> * Picking Huacai's Acked tag, I seem to have lost it in the last version.
> 
> v2:
> * Switch to strcasestr().
> * Use "test -f" instead of "[-f FILE]".
> 
> v1:
> * LoongArch and riscv don't have tools/arch/xxxxx/include/uapi/asm/mman.h,
>   let's modify the detection rules.
> * Allow to use cpuinfo on loongarch.
> 
> Yanteng Si (3):
>   perf/tools: Allow to use cpuinfo on LoongArch
>   perf/trace: Fix mmap_flags for archs use generic mman.h
>   perf/trace: Use "test -f" instead of "[-f FILE]"
> 
>  tools/perf/trace/beauty/mmap_flags.sh | 7 +++++--
>  tools/perf/trace/beauty/mmap_prot.sh  | 5 +++--
>  tools/perf/util/header.c              | 2 ++
>  tools/perf/util/svghelper.c           | 2 +-
>  4 files changed, 11 insertions(+), 5 deletions(-)
> 
> -- 
> 2.31.4
> 

-- 

- Arnaldo
