Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B932931DB
	for <loongarch@lists.linux.dev>; Mon, 27 Jul 2026 04:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124846; cv=pass; b=KBzIOUXg8901IIFeFfsqxOpz/0scgon79c24ZR24ecWyqUTDCkSDxl1CC+X/c612eGvq9Gf2vgZj3OKE9CdLxXSayRz/PV3xWcWPVOYDy/9QFXxmTJ5z4TPYn7dobAv+Numeko45xFQEX2Ctfuef5ef458CODH07fgeIjzQXrbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124846; c=relaxed/simple;
	bh=jP7ZYlIVgJ80vLRFwlkcQMyjVn9RFAqIf9ZF2g9O3Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLUM7i3MHU++KVOywJGw8vMrnpp/iXyyYQV7I8gMKFa7nYrPUJPHx0pLZOri/IJwRs2h4GGxYhGpRPrtF/jOKiAUpTFkwZ7TddjCAcwwW/cvf9SSecYuMJ4r1CBBcmSKcX6LzMcuN5neQjugP03hDUVdJiTb7sWnTuKNnSdaIjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHUQRHxr; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHUQRHxr"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4566a5bc186so1223504fac.1
        for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 21:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785124844; cv=none;
        d=google.com; s=arc-20260327;
        b=UdTDcouxnhIbKOxrR5ITPyB478s9zlYxtISnDKrj8gDQQms/NNtVGrk6NG9JHffxzq
         294TixUyCGw69ZeajkIa0Mm2bw0uXVOgrvHPzK65swritLuv9mcMCjCg6CsJsvbni1Xb
         XKIk4zip2z2m+TNnR5eYEuwAGGBnk45OAA0KkQv0PWlWRYMV/THRJ5vgNpbTQl/MxLsv
         HnDMO3J9Q8Pi78eChxodDi4kOQF4mvNDhGZ4Xnc/Oq4R8gsUg4e1TDPEG7sJ8O0pF6H6
         zp0KLUZZpQcMKLNZo6gi/8P9ryBI5uJ06rZEdNT9EJbDh8J/xnnK3DAsCfkSSQH9AUlE
         ODHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5G7pWsivX/qlKJsYxp4np8Z21sOvRYdOzSosNcT2Zb8=;
        fh=exDkr06ksFtdy1rSpFyXCfT1TqwxidSJ4KUTaXyMXKo=;
        b=nfMg7SXGuFMRPdaYYOu9xsigsRBD8JpIHFRiAMer8OcI/Cle2O82F3hVYPbUQK9sUv
         /p+sRhiQTg87QaC87F9mASxe4Cqbg19K/JcvpNz08yfTIcpn7EbXXYDiv4FfY0aQSo2d
         nrhnHgXCnszsLIlhUzN+vKjTe9F8Ug2Q9zDSJDa1KZm04w75zj/psWLJksREU7Hiv1P/
         lkNCN1L6vT4htEo9MDViwmUTiWn1Kg2isC0IuiqRYM9ml92OKFCFfic+6CBlIf5kCedb
         R1fqaJentfHEr3VftC83eikXSPB+sK3QDkWMDM51xRMDQEaBUuEBxfznB+FWBGBJ5z4j
         sayw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785124844; x=1785729644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5G7pWsivX/qlKJsYxp4np8Z21sOvRYdOzSosNcT2Zb8=;
        b=RHUQRHxrvchX/WxNiHdVJj9vJuDb22JfsqZARFl2WZB8Ja7U0AwjT+knKxVkyFoWUa
         E172RmDJDkdE/GS79/kRTwqKyIONzQJ6xlLYrhf2M9jvzVwuWq9LUeKAMtCk6XFuRWsq
         ZyyZs5KRtWYuC3F95y4ZKgkeYKRyRlNSbYvYoikjsc1rsnacYaif9gB2n19eGwxsEVHs
         gpXKZ+tc3MiwQkw+GkNvdTtna0S5nZikzxpqfEYizfF1X+xuWZlb4XXf3YxpsORN4oXV
         v/QDWYq9HGQn+oGjq9I4mY52ZrSAHNZXanLwWpA3WqhAfg+M1Fbyb1b+C2Q3+uNqwLTt
         to7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785124844; x=1785729644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5G7pWsivX/qlKJsYxp4np8Z21sOvRYdOzSosNcT2Zb8=;
        b=Htd3BE8w5RgmHLswwlL0QCgRid+FjuN0QafxczvXTt5g6kQL8CWKCcsp4TXlsfUbTS
         bAkypgBEcdZWlq8IwuD28yALNEfAMwmrrhJYFCXsb8PaAKLBBxxMhLJdXsqL9IM16GE6
         laR8UJDXCrpJ8wPmlXfBaJpskg3LlIb+zv50jsknf/xAauiNgl/dbhAyqpS4wDdTlZ5M
         GI5dC0JQHjx+PDd56TnbIwvgRm60ABheP0Ug1VVe1iWbdTG+wlz5BiZdkCHo6WxkA3iH
         ERm+sxaaGrwqt1WtAVASrezJa1lSr/MExVm30qFOQtS0bi5UUg3h+1Toa3Emy6dWuzei
         NiWw==
X-Forwarded-Encrypted: i=1; AHgh+RqkHyLrriB9/M6P+0LgDO00gkccFEyDkTL6UJxj2iVmnnLC2730uBdEsaNnKMApbrc46nGFtX4xPYg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc6d+lnjHVOCYZK6fvX1CUfz/iGyQbH4wbfXGIBjWQQmvHRUjS
	aqf85K4mVnL1udKo16ig89NocA2/k4grKC/BVSDm49/D2UI76w5T1xF544GDc8Jy/xcZEQoCtu3
	xSIwnjoVpq4c00lTXHWRJCoE84A7UiC8=
X-Gm-Gg: AR+sD12cgdaMV33+0IJl+kUnJTeh6LC08EWp7RFfExDCMnqdjWJb7xGfb4cvuRqsQZd
	U41KjqB274mN/XUOs1AqWBCX874Idual9XnosTDHru52tINmyh04cSPVLSYipUwrx/FGfksBnZB
	Yjye3/9NyJFXo8iQEPYgb0YRXDNi25ivLXmgq/2F1jTd3AKM2oLvrD93TSlJeZPdHXy3tDbxXeY
	AG9D0bfJ4NGOOF2qemAxT7FU+krrZnf4OzmqUGfHv609Z/kGZ5XdomYnwqTHPQ=
X-Received: by 2002:a05:6871:411:b0:456:b6b3:605b with SMTP id
 586e51a60fabf-457f247a181mr5774137fac.16.1785124844261; Sun, 26 Jul 2026
 21:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622071234.1410830-1-zhaochenguang@kylinos.cn>
In-Reply-To: <20260622071234.1410830-1-zhaochenguang@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 27 Jul 2026 12:00:33 +0800
X-Gm-Features: AUfX_mxKqB9XACgz1TxIXvRnSyNtJ4IGNei07VNWDuXv_cK7wY1OAxWx3rTreEs
Message-ID: <CAEyhmHQ=h3p=xsSBBeVAKD3BPfYyP_vkuOgsHQRcSM_bWEJuNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] LoongArch bpf kptr xchg inline support
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 3:18=E2=80=AFPM Chenguang Zhao <zhaochenguang@kylin=
os.cn> wrote:
>
> This series enables the BPF verifier to inline bpf_kptr_xchg() into BPF_X=
CHG
> on LoongArch64, and fixes the underlying JIT atomic ordering that makes s=
uch
> inlining safe.
> The BPF verifier can lower bpf_kptr_xchg() to a single BPF_XCHG atomic wh=
en
> the JIT advertises ptr xchg support via bpf_jit_supports_ptr_xchg(). This
> removes helper-call overhead from the kptr exchange fast path. Inlining i=
s
> only correct when the JITed exchange provides the same sequentially consi=
stent
> ordering as the bpf_kptr_xchg() helper.
> Patch 1 fixes memory ordering for all value-returning BPF atomic RMW oper=
ations
> emitted by the LoongArch bpf JIT. Per LKMM, value-returning atomic RMW mu=
st
> provide sequentially consistent ordering. Plain AMO instructions and bare
> ll/sc loops on LoongArch do not satisfy this by themselves:
>  - BPF_FETCH (ADD/AND/OR/XOR): switch to am*_db.{b,h,w,d}
>  - BPF_XCHG: switch to amswap_db.{b,h,w,d}
>  - BPF_CMPXCHG: emit dbar 0x700 after the ll/sc loop, matching
>    __WEAK_LLSC_MB in cmpxchg.h
> Non-value-returning RMW ops (plain BPF_ADD, BPF_AND, etc.) remain weakly
> ordered, consistent with LKMM. This fix is independent of kptr inlining a=
nd
> benefits all BPF programs using value-returning atomics on LoongArch.
> Patch 2 implements bpf_jit_supports_ptr_xchg() so the verifier may inline
> bpf_kptr_xchg() on LoongArch64.
> Patches 3 and 4 extend bpf selftests: functional coverage via kptr_xchg_i=
nline,
> and an optional kptr-xchg benchmark to compare helper vs inlined paths.
>
> Chenguang Zhao (4):
>   LoongArch: bpf: Fix memory ordering for value-returning atomics
>   LoongArch: bpf: Advertise JIT support for kptr xchg inline
>   selftests/bpf: Enable kptr_xchg_inline test on LoongArch
>   selftests/bpf: Add kptr-xchg benchmark
>

Hello, sorry for the long delay. Please rebase and resend this series. Than=
ks.

>  arch/loongarch/include/asm/inst.h             | 18 ++++
>  arch/loongarch/net/bpf_jit.c                  | 37 ++++---
>  tools/testing/selftests/bpf/Makefile          |  2 +
>  tools/testing/selftests/bpf/bench.c           |  2 +
>  .../selftests/bpf/benchs/bench_kptr_xchg.c    | 96 +++++++++++++++++++
>  .../bpf/prog_tests/kptr_xchg_inline.c         |  3 +-
>  .../selftests/bpf/progs/kptr_xchg_bench.c     | 49 ++++++++++
>  7 files changed, 192 insertions(+), 15 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/benchs/bench_kptr_xchg.c
>  create mode 100644 tools/testing/selftests/bpf/progs/kptr_xchg_bench.c
>
> ---
> v3:
>  - Expand the JIT ordering fix beyond BPF_XCHG w/d to all value-returning
>    atomic RMW ops (BPF_FETCH, BPF_XCHG, BPF_CMPXCHG), using barrier-carry=
ing
>    AMO variants and dbar after ll/sc as required by LKMM.
>  - Add __btf_root() in the benchmark BPF program so bpf_obj_drop() remain=
s
>    visible to libbpf's kfunc linker when bpf_kptr_xchg() is inlined.
>
> v2:
>  - https://lore.kernel.org/all/20260603100438.2177817-1-zhaochenguang@kyl=
inos.cn/
>
> v1:
>  - https://lore.kernel.org/all/20260602021515.214560-1-zhaochenguang@kyli=
nos.cn/
>
> --
> 2.25.1
>
>
