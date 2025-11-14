Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4982C15AA
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 04:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763095367; cv=none; b=otoMV2E5JvQXKe+oEfdjGncQUp9EVtDNpZ60uy2tEc+tOlBXjuyDXzrkk7K96WhukHy4cReyeBFCUC25RTxKO06ejycYYX0XkbjBQbGu5khobVEZss1pg/1tsB6RZV1Sr2cV7/7kM9iyhELZZ+Yffyaeg+VVyQKZbHQubodQHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763095367; c=relaxed/simple;
	bh=5L0YXurkICT9f9ToiOc9/erasDW6cnHbqAVD1Wx6R3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wdj1ztK7R9Uc7G1C4hScdcLBUqA3Ri9m8tbDdyV15qF21iUA9a27SGU199KH/yKlEiufzdgTEkKWHo6dDoAXCwq4lc58Nd1P30eVoZ2hFlR8pSdQngP6R+neUJ6RdYv+EChMfnykdBIAzrBEspGrLttQNjzg7E1PoiBe/EaKa5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnivr8/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnivr8/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2974C4CEF1
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 04:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763095366;
	bh=5L0YXurkICT9f9ToiOc9/erasDW6cnHbqAVD1Wx6R3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jnivr8/VhAYyadawnMe8JE/Y8VgXPqLUf4ndrIHWMQNim3dDEYikTEIWVZbwiG8+U
	 2vc6JLEnsE46fDchj3Iedo+kYi5b03wCPXBZI97RqjqzavtGGBcupgjqgm7yLP3G2L
	 LeZmFY/L7d5g41VQmifuVdr1ZQQmO4OUEDi43aTJoIJ9phwbYXPcZt6W7FiciwfkbL
	 xOX5jcwJy8aW43Pp75CIiX3+ljv4RdCVTZ0DA3o5v2qPvco9Affepjo7PmchrDFsuc
	 sINzYlj5ulPWFHWsgf+V3AQIIqr97lIUmNZDFvJ8KljQ3/YVDT2ISSI3V4WDMK+xql
	 2Cl3Z1xWvlldQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso2574952a12.1
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 20:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbX250gGJVM5/9TZbJUGSB7H1Xhau6nvynU9zSsbTEzvQIeNXKrWgfr+z2I1PM4c2Pmc4P7FNN33w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH6EJdL/ABGORNZqJTE6+9gtjyRxSMxc+kZweGWg44HQPmgi3x
	AwrdzUXs+2MdnNT4mL8m/wJhpJdLK7lj6P3Ry+oFLgusSTjIE0WMoiCbyj/waGXCQ9WH9AZ2WJq
	AvGN4qn27jRSQn/rvMnUntzRYv/6fqAI=
X-Google-Smtp-Source: AGHT+IG3N1FmfTv5BYgypaO2bSWftPTi3Qp27me0YKdtu/tGu4ja/RkXdhexn/tccPG1IT6fnJXQseEbxUfPHv80trE=
X-Received: by 2002:a17:907:9806:b0:b72:d9ee:db89 with SMTP id
 a640c23a62f3a-b736794c248mr143604066b.47.1763095365069; Thu, 13 Nov 2025
 20:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112090511.2431689-1-maobibo@loongson.cn>
In-Reply-To: <20251112090511.2431689-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Nov 2025 12:42:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5dm0c9b7uPgbK4GY9kBHgjnigiVWCunMsjN_bgbTo2Bg@mail.gmail.com>
X-Gm-Features: AWmQ_bnvfPDtb3Oz-9_pGH_vR_TwYFIJJE3Kr-sv5vp_Ug9vfhzn0ffxjHAn-H4
Message-ID: <CAAhV-H5dm0c9b7uPgbK4GY9kBHgjnigiVWCunMsjN_bgbTo2Bg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix numa node parsing with memblk on virt machine
To: Bibo Mao <maobibo@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied but keep the info display, thanks.

Huacai

On Wed, Nov 12, 2025 at 5:05=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> On physical machine, numa node comes high bit 44:48 of physical address.
> However it is not true on virt machine. With general method, it comes
> from ACPI SRAT table.
>
> Here common function numa_memblks_init() is used to add numa node
> information with memblk.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kernel/numa.c | 82 +-----------------------------------
>  1 file changed, 2 insertions(+), 80 deletions(-)
>
> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
> index d6e73e8f9c0b..987496c3b915 100644
> --- a/arch/loongarch/kernel/numa.c
> +++ b/arch/loongarch/kernel/numa.c
> @@ -157,74 +157,6 @@ static void __init node_mem_init(unsigned int node)
>  }
>
>  #ifdef CONFIG_ACPI_NUMA
> -
> -/*
> - * add_numamem_region
> - *
> - * Add a uasable memory region described by BIOS. The
> - * routine gets each intersection between BIOS's region
> - * and node's region, and adds them into node's memblock
> - * pool.
> - *
> - */
> -static void __init add_numamem_region(u64 start, u64 end, u32 type)
> -{
> -       u32 node =3D pa_to_nid(start);
> -       u64 size =3D end - start;
> -       static unsigned long num_physpages;
> -
> -       if (start >=3D end) {
> -               pr_debug("Invalid region: %016llx-%016llx\n", start, end)=
;
> -               return;
> -       }
> -
> -       num_physpages +=3D (size >> PAGE_SHIFT);
> -       pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx B=
ytes\n",
> -               node, type, start, size);
> -       pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0=
x%lx\n",
> -               start >> PAGE_SHIFT, end >> PAGE_SHIFT, num_physpages);
> -       memblock_set_node(start, size, &memblock.memory, node);
> -}
> -
> -static void __init init_node_memblock(void)
> -{
> -       u32 mem_type;
> -       u64 mem_end, mem_start, mem_size;
> -       efi_memory_desc_t *md;
> -
> -       /* Parse memory information and activate */
> -       for_each_efi_memory_desc(md) {
> -               mem_type =3D md->type;
> -               mem_start =3D md->phys_addr;
> -               mem_size =3D md->num_pages << EFI_PAGE_SHIFT;
> -               mem_end =3D mem_start + mem_size;
> -
> -               switch (mem_type) {
> -               case EFI_LOADER_CODE:
> -               case EFI_LOADER_DATA:
> -               case EFI_BOOT_SERVICES_CODE:
> -               case EFI_BOOT_SERVICES_DATA:
> -               case EFI_PERSISTENT_MEMORY:
> -               case EFI_CONVENTIONAL_MEMORY:
> -                       add_numamem_region(mem_start, mem_end, mem_type);
> -                       break;
> -               case EFI_PAL_CODE:
> -               case EFI_UNUSABLE_MEMORY:
> -               case EFI_ACPI_RECLAIM_MEMORY:
> -                       add_numamem_region(mem_start, mem_end, mem_type);
> -                       fallthrough;
> -               case EFI_RESERVED_TYPE:
> -               case EFI_RUNTIME_SERVICES_CODE:
> -               case EFI_RUNTIME_SERVICES_DATA:
> -               case EFI_MEMORY_MAPPED_IO:
> -               case EFI_MEMORY_MAPPED_IO_PORT_SPACE:
> -                       pr_info("Resvd: mem_type:%d, mem_start:0x%llx, me=
m_size:0x%llx Bytes\n",
> -                                       mem_type, mem_start, mem_size);
> -                       break;
> -               }
> -       }
> -}
> -
>  /*
>   * fake_numa_init() - For Non-ACPI systems
>   * Return: 0 on success, -errno on failure.
> @@ -249,22 +181,12 @@ int __init init_numa_memory(void)
>         for (i =3D 0; i < NR_CPUS; i++)
>                 set_cpuid_to_node(i, NUMA_NO_NODE);
>
> -       numa_reset_distance();
> -       nodes_clear(numa_nodes_parsed);
> -       nodes_clear(node_possible_map);
> -       nodes_clear(node_online_map);
> -       WARN_ON(memblock_clear_hotplug(0, PHYS_ADDR_MAX));
> -
>         /* Parse SRAT and SLIT if provided by firmware. */
> -       ret =3D acpi_disabled ? fake_numa_init() : acpi_numa_init();
> +       ret =3D acpi_disabled ? numa_memblks_init(fake_numa_init, false) =
:
> +                       numa_memblks_init(acpi_numa_init, false);
>         if (ret < 0)
>                 return ret;
>
> -       node_possible_map =3D numa_nodes_parsed;
> -       if (WARN_ON(nodes_empty(node_possible_map)))
> -               return -EINVAL;
> -
> -       init_node_memblock();
>         if (!memblock_validate_numa_coverage(SZ_1M))
>                 return -EINVAL;
>
>
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> --
> 2.39.3
>
