Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D04829CB32
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756304557; cv=none; b=lMiO9fZCdZIk7NT+3Qyw3wEwFi7wtHx0xQRyaRa0yUncLH2bTfjlWNy47jnf+EEHrYQAkdmlN05F4bA/XiayPoDQC1Vu/qHuZrmsmtpJSBoMYfIMzSV1olu0mZ8I86R0cByTgtXXHHLlmEFVUTtnsRKGS5e6SBRlLJ2ZeMnNAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756304557; c=relaxed/simple;
	bh=GeqWgwT4sAUmsoagfWwhs2u8RfJZCpVqkxjVz3HfX5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGZJXjBLJ26r7hy8WwLh2WRKe7nrpZpjFBmgsHLbbBvUCfBrQYQpxm7H75Ryr6utMSb6/Vuf73p63Qo1HdU0Wfmt8IKZiuQK7XlSJ7m6Q604qFud6uXI6IbGJ+8GC5kooriadEEj4bAQ4bgM3tkApFossTiluodwf2MWL7zGzo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6nr8yXu; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6nr8yXu"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e8704cdc76so728683685a.1
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756304554; x=1756909354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5re1CNxOrtxP/Ayif8QgNX+1ItqV8/B/L71l3X/hec=;
        b=i6nr8yXuKrPPrC+CjNgghgF3eDPHyYeqlX+JBYxIaqjMqJk59oVXUYpknn7vRP7GPd
         NOxXF8EeMSLSMPB4RD1cEvz881HHJ7NkpWQKOSMpkSWzBfzIxo5kgAuyCICWgmjKhaWG
         Ya/2VtRNrJ7wwvViSCh28YgEiZT9kwNPnQYF4R8/XqPjGVCmnJkf8SSs1ZZk9Mgj/poz
         AtK5pY5oGljSU923sCRgbGsBr3Jj5C1M0qXc7A8rr6YnfOyqxOPwLQ+mCloVOJgSwjVV
         m5WWxAfTuLBPYCachzQTA2jRI4/sCiWpwlG7SksaeUHtRMyUU/8RGyrIDzV78t4uXUYS
         i5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756304554; x=1756909354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5re1CNxOrtxP/Ayif8QgNX+1ItqV8/B/L71l3X/hec=;
        b=Dn/pRRrsBdloMqZdc4kTZQ7UDamuu2Cw6U1D/g5+LI6f/ujDlBjxWXQ7LkhR2gZlrS
         5zdmxo4hJgGvssE6yfndE6YkHQ2v8NI9XonfJbkXVYlayQkjvxZ8njooBNk5cnDksEKw
         YnYuueImH2S2tno54UhPpbqZLct4bJPTlyNrGI5ZxhAxsvIYmS6hf/ZFsdFk6PC5n4nI
         XkOEuJ4Qy0XAvNGuEC7CAC0O+mGh7z7cAe1v290qfQ2vLwaY03StyocnQT9jQbPodBtk
         n224Z1rXz6nNJITOBPMsq32WuyE8+TqdNXvzBS3kYP8/POf61YQhud73hyBK+SDTWk78
         LzWw==
X-Forwarded-Encrypted: i=1; AJvYcCVfFKSLnqaue9pOSLLRndeoQE0WlCDWQ65Z5n/ULtgb4gsQr6A7mUGf0W6PgFReog0DU6FolkZQxTE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaermeRciTe05NQrbBMjfzVNaz1ojTKzjb7tOnd2rvz57mZPK/
	+nyCFzIX2iueOYQIi6qCQdpl9EAN8tD9LlBuxC/cZedpz7Ne25zzgAjJXFvOMwoIoWvP1gZJzDc
	9yLg1pnEdTQkf/t9HusPF9SadhOtZ8cw=
X-Gm-Gg: ASbGncsip1AbcSpqI217xXfh6utnQk8t30/m7V9VhQ3w4rCs8TlvUOBSuyx7us5maNU
	l93yRDpHtGiB+N/xCS2bCpmsZiGAatx1jxe7S8BLFnyc940G2uBPC2bM2jL9gkkE255SxD6vsFY
	HxyfzphMEPZJbv226isJ8B2jsc1W/bxfMnX2LNe24LHSIe70MCCsTAhJbNK5jMcKodcnUjymQWh
	KaMl3Q=
X-Google-Smtp-Source: AGHT+IEslLJkl0ZeuNaKCzmfBShY64wlqef+fuiIb6XpRJiS3xat/lF1MmMoqGhwoODlIqS4kVLbxpod+nXSv5kvoxE=
X-Received: by 2002:a05:620a:aa19:b0:7f3:9036:13f1 with SMTP id
 af79cd13be357-7f390456b65mr1050631085a.49.1756304554037; Wed, 27 Aug 2025
 07:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827094733.426839-1-hengqi.chen@gmail.com>
In-Reply-To: <20250827094733.426839-1-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 27 Aug 2025 07:22:21 -0700
X-Gm-Features: Ac12FXyTqKDbfmdcT2o4ZfZI0BPOE1IlkIAt6nFApsVRsY5DFVdrrp-xTu27jj8
Message-ID: <CAK3+h2yJL4BFdsuXd3x+tVU4EcTinixbXwckbF1EwzepZWHXmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: Fix BPF trampoline related issues
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, jianghaoran@kylinos.cn, 
	duanchenghao@kylinos.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, bpf@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 4:19=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The following two selftest cases triggers oops on LoongArch:
>
>     $ ./test_progs -a ns_bpf_qdisc -a tracing_struct

Last time I skipped struct_ops test and now I updated the test
accordingly, no kernel hangs and test result is expected for this
series:

./test_progs \
--deny=3Dmodule_attach \
--deny=3Dsubprogs_extable \
--deny=3Dtimer_lockup \
--json-summary=3D"./bpf_selftests.json"

#213/1   ns_bpf_qdisc/fifo:OK
#213/2   ns_bpf_qdisc/fq:OK
#213/3   ns_bpf_qdisc/attach to mq:OK
#213/4   ns_bpf_qdisc/attach to non root:OK
#213/5   ns_bpf_qdisc/incompl_ops:OK
#213     ns_bpf_qdisc:OK

#408/1   struct_ops_autocreate/cant_load_full_object:OK
#408/2   struct_ops_autocreate/can_load_partial_object:OK
#408/3   struct_ops_autocreate/autoload_and_shadow_vars:OK
#408/4   struct_ops_autocreate/optional_maps:OK
#408     struct_ops_autocreate:OK
#409/1   struct_ops_kptr_return/kptr_return:OK
#409/2   struct_ops_kptr_return/kptr_return_fail__wrong_type:OK
#409/3   struct_ops_kptr_return/kptr_return_fail__invalid_scalar:OK
#409/4   struct_ops_kptr_return/kptr_return_fail__nonzero_offset:OK
#409/5   struct_ops_kptr_return/kptr_return_fail__local_kptr:OK
#409     struct_ops_kptr_return:OK
#410/1   struct_ops_maybe_null/maybe_null:OK
#410/2   struct_ops_maybe_null/maybe_null_fail:OK
#410     struct_ops_maybe_null:OK
#411/1   struct_ops_module/struct_ops_load:OK
#411/2   struct_ops_module/struct_ops_not_zeroed:OK
#411/3   struct_ops_module/struct_ops_incompatible:OK
#411/4   struct_ops_module/struct_ops_null_out_cb:OK
#411/5   struct_ops_module/struct_ops_forgotten_cb:OK
#411/6   struct_ops_module/test_detach_link:OK
#411/7   struct_ops_module/unsupported_ops:OK
#411     struct_ops_module:OK
do_struct_ops_multi_pages:PASS:struct_ops_multi_pages_open_and_load 0 nsec
do_struct_ops_multi_pages:FAIL:attach_multi_pages unexpected error: -7
#412/1   struct_ops_multi_pages/multi_pages:FAIL
#412     struct_ops_multi_pages:FAIL
#413/1   struct_ops_no_cfi/load_bpf_test_no_cfi:OK
#413     struct_ops_no_cfi:OK
#414/1   struct_ops_private_stack/private_stack:SKIP
#414/2   struct_ops_private_stack/private_stack_fail:SKIP
#414/3   struct_ops_private_stack/private_stack_recur:SKIP
#414     struct_ops_private_stack:SKIP
#415/1   struct_ops_refcounted/refcounted:OK
#415/2   struct_ops_refcounted/refcounted_fail__ref_leak:OK
#415/3   struct_ops_refcounted/refcounted_fail__global_subprog:OK
#415/4   struct_ops_refcounted/refcounted_fail__tail_call:OK
#415     struct_ops_refcounted:OK

test_struct_args:PASS:tracing_struct__open_and_load 0 nsec
libbpf: prog 'test_struct_arg_1': failed to attach: -ENOTSUPP
libbpf: prog 'test_struct_arg_1': failed to auto-attach: -ENOTSUPP
test_struct_args:FAIL:tracing_struct__attach unexpected error: -524 (errno =
524)
#468/1   tracing_struct/struct_args:FAIL
test_struct_many_args:PASS:tracing_struct_many_args__open_and_load 0 nsec
libbpf: prog 'test_struct_many_args_1': failed to attach: -ENOTSUPP
libbpf: prog 'test_struct_many_args_1': failed to auto-attach: -ENOTSUPP
test_struct_many_args:FAIL:tracing_struct_many_args__attach unexpected
error: -524 (errno 524)

>
> This small series tries to fix/workaround these issues.
> See individual commit for details.
>
> While at it, remove a duplicated flags check in __arch_prepare_bpf_trampo=
line().
>
> v1 -> v2:
> * collect Acked-by/Tested-by tags
> * update sign_extend() in patch 2 as suggested by Huacai
>
> Hengqi Chen (3):
>   LoongArch: BPF: Remove duplicated flags check
>   LoongArch: BPF: Sign extend struct ops return values properly
>   LoongArch: BPF: No support of struct argument in trampoline programs
>
>  arch/loongarch/net/bpf_jit.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>
> --
> 2.43.5
