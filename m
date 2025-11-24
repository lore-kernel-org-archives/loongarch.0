Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4582BD5BB
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764006680; cv=none; b=bQvc8dwykG4sPXZnPMzYD7H7RjRP7EMTx46mmz8sYHJqoBO/hw/v+9q/XIPNglS1WSpU2Wd5IkrW6BNw+DO4/sqTDjHCJ17ZGQlVwT2+jBCgaFz7dMEafYDdW1FtzO8cAPjb4DEGu91S+bvjY+nTMZGrGyELwaxWquY96O+bj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764006680; c=relaxed/simple;
	bh=MCHPn0rQhoplV/QYv/ut7zSdvjJ1ZJFogsmM2UlkmS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3j2Bm+skcSFvv3LnxbbLhfEvy9d1VCBMWYa5nSuQ7oOnNP6Fq+XkLuKirc7ZNmHqPipeEN3Yh7T16O6t+Udwy0SX77ja3jai3SNLwnmdd1SrryJd8TfSYfhyXhuoa62VP+2qAIu9RRLsw2cwEpdg/OVhz1UefXThbs2UUsVGdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1YAZ+OL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1YAZ+OL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4edb7c8232aso58591591cf.3
        for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764006677; x=1764611477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SWybCBY7kVZcTpWh5WO+xLZTsf66usoaK5JELctdv8=;
        b=B1YAZ+OL1kujokh7zi7Zsv5YjxUBwXU5nnvcyl8aIxMxUgUkp/WkChe3qK4YjzRY0r
         00RKKKp681xUU4eCLGcLfQYfpzT8iyUDrLn23xkg0EtUWOQ5oKiUub7mYqEz+yNu88Ko
         EUHfpm/rjLnNKHHv6Dnqn32iCd2ZfD3SsDyTXPjnB7V8PA/TCfq7hlfxYnxWfwWw+40D
         suPYSLMee9w5yWy4NdFedBkX8lpi2IPJRoxAj13CDmCb1vX7i4F3DrG5gf7Pou0qqwNc
         WiQzwOI8SGco4TmqNvtT3BH3ByVNMIqKPjDGUQDPzKbbVEbfWi9y9X4OdHANHnIeEdfE
         8M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006677; x=1764611477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/SWybCBY7kVZcTpWh5WO+xLZTsf66usoaK5JELctdv8=;
        b=A/9N3r3yLz2fMh/KKzD8pya1OnzNBj7zMFOFCfxevbbPI4xUVzGaw3JEibUfm8pyBG
         7oF5qyLYEBP6Bvxx5ZH2TF/6l1cP527G9bzDAxfftoUbLxBVMd7lGJvSjJos0pVRCUwr
         BKIdiwCkaAT4U1WgVq5lZ6XaWieM/8EWXgylSUMS2qgffdUhBwfgKy8NTGmlEpecdf+D
         PsHR1eoKPuX2wmNKaXrUXhFCugsPjHS1O0KD+jNMJn3ZO+p9D2P+83j1TzvS7K+1Sbne
         F7Dy2v2f7QRgZ1rPGPdase+S9p1he4Welb+ejPz1iClNetDWXmESNZ/OVvNK+SQawqXt
         b25g==
X-Forwarded-Encrypted: i=1; AJvYcCW0rdFgsx+LIz1LvzkMNDptMTTQhRmWurNYGenOKZcBFPLe26bOP3MlsdCEhD8ktcrOkaY6wqQjTxg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSIQn5rW1qjzQk27SkD+UyC7w4/R9Dh2fEkffG5Sgyw6ycEs6k
	kcnUsEmo4wOi7kDlJSpXBvg+7iWSuwicwRSCa6FSYVy0bMpa36zCIISMlJD/taXb4bbW7yHooLv
	w/kd4SeshDjPRVibaib89JqxUFCXw9WPOrL2q
X-Gm-Gg: ASbGncsNllJCYn/nvdX+7qWvcst3rsy6YQHzPhQC2jlHP0H1mk4XzPDmIa3hGMqvnCK
	oPdYfrkU+OF5yiAgq5BFZdki6qHvM8c2JTNkeBMCyv07jXwIOdTDsIWGCmWnGdwibdiI9VJqfch
	k9AJhiGDqYBfsziVfT3sO/su6DfY7aiVmizZGAuIqcOMIYCcGB0eBoWtdhzBKCSMIMmw9ebOBnB
	OxomC/gkZ0QQ8gHRKLMf3ePTITOb+aVl6U2NRXBbHD6GyrPG891/S+Xexmokw4gsUloEDE=
X-Google-Smtp-Source: AGHT+IHZQb7ljBnJ+GLycfIk7ywSln4DklXCqSbOqTFIEr2W/r6gYeBe36lJ2viVjxeGBbeuRA2UTh3YOVSTgATDLFY=
X-Received: by 2002:ac8:5a82:0:b0:4ed:af59:9df0 with SMTP id
 d75a77b69052e-4ee58adf8efmr192764211cf.40.1764006676919; Mon, 24 Nov 2025
 09:51:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com>
In-Reply-To: <20251124055642.1591-1-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 24 Nov 2025 09:51:06 -0800
X-Gm-Features: AWmQ_bkMVPRtW4nANU-nGpLFVLFhwu90pr59uEwCiR4vE7bvMOUleEY3x9PU2NE
Message-ID: <CAK3+h2zJOQ0RAXhQvTKyyGp-nf_HoJxri8nBi44aWC0YN2-d6w@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 9:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> This small set implement new features with 2 bug fixes for BPF.
>
> * Patch 1 fixes a bug discovered while testing the BPF Arena feature.
>   Without this fix, the arena_htab test case which use the
>   bpf_arena_alloc_pages kfunc will trigger a kernel panic.
> * Patch 2 fixes a subtle bug for tail call index, this can be verified
>   by the verifier_runtime_jit test case.
>   See the following two threads for background:
>     - https://lore.kernel.org/bpf/CAEyhmHTvj4cDRfu1FXSEXmdCqyWfs3ehw5gtB9=
qJCrThuUy2Kw@mail.gmail.com/
>     - https://lore.kernel.org/bpf/20251005103518.996383-1-luis.gerhorst@f=
au.de/
> * Patch 3 uses pack allocator for BPF programs (BPF trampoline already
>   use pack allocator, this make it complete), with this, no regression
>   on existing selftests
> * Patch 4 & 5 implements basic support for BPF Arena, the following
>   test cases passed:
>     - arena_htab
>     - arena_list
>     - verifier_arena
>     - verifier_arena_large
>
> Hengqi Chen (5):
>   LoongArch: BPF: Sign extend kfunc call arguments
>   LoongArch: BPF: Zero-extend bpf_tail_call() index
>   LoongArch: BPF: Use BPF prog pack allocator
>   LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
>   LoongArch: BPF: Implement bpf_addr_space_cast instruction
>
>  arch/loongarch/net/bpf_jit.c | 225 ++++++++++++++++++++++++++++-------
>  arch/loongarch/net/bpf_jit.h |  30 ++++-
>  2 files changed, 213 insertions(+), 42 deletions(-)
>

Hi Hengqi,

you can add Tested-by: Vincent Li <vincent.mc.li@gmail.com>

[root@fedora bpf]#./test_progs --deny=3Dtimer_lockup
--json-summary=3D"./bpf_selftests.json"

[root@fedora bpf]#cat bpf_selftests.json | jq . > bpf_selftests.txt

[root@fedora bpf]# grep -B4 '"failed": true' bpf_selftests.txt | grep
-v '"message":'
    {
      "name": "arena_atomics",
      "number": 3,
      "failed": true,
--
    {
      "name": "arena_spin_lock",
      "number": 6,
      "failed": true,
--
        {
          "name": "arena_spin_lock_1",
          "number": 1,
          "failed": true
--
        {
          "name": "arena_spin_lock_1000",
          "number": 2,
          "failed": true
--
        {
          "name": "arena_spin_lock_50000",
          "number": 3,
          "failed": true
--
    {
      "name": "bpf_tcp_ca",
      "number": 31,
      "failed": true,
--
        {
          "name": "tcp_ca_kfunc",
          "number": 14,
          "failed": true
--
    {
      "name": "build_id",
      "number": 46,
      "failed": true,
--
        {
          "name": "nofault-paged-out",
          "number": 1,
          "failed": true
--
    {
      "name": "dynptr",
      "number": 97,
      "failed": true,
--
        {
          "name": "test_probe_read_user_dynptr",
          "number": 27,
          "failed": true
--
        {
          "name": "test_probe_read_kernel_dynptr",
          "number": 28,
          "failed": true
--
        {
          "name": "test_probe_read_user_str_dynptr",
          "number": 29,
          "failed": true
--
        {
          "name": "test_probe_read_kernel_str_dynptr",
          "number": 30,
          "failed": true
--
    {
      "name": "exceptions",
      "number": 101,
      "failed": true,
--
        {
          "name": "reject_exception_cb_type_1",
          "number": 1,
          "failed": true
--
        {
          "name": "reject_exception_cb_type_2",
          "number": 2,
          "failed": true
--
        {
          "name": "reject_exception_cb_type_3",
          "number": 3,
          "failed": true
--
        {
          "name": "reject_exception_cb_type_4",
          "number": 4,
          "failed": true
--
        {
          "name": "reject_async_callback_throw",
          "number": 5,
          "failed": true
--
        {
          "name": "reject_with_rcu_read_lock",
          "number": 8,
          "failed": true
--
        {
          "name": "reject_subprog_with_rcu_read_lock",
          "number": 9,
          "failed": true
--
        {
          "name": "reject_with_reference",
          "number": 11,
          "failed": true
--
        {
          "name": "reject_with_cb_reference",
          "number": 12,
          "failed": true
--
        {
          "name": "reject_with_cb",
          "number": 13,
          "failed": true
--
        {
          "name": "reject_with_subprog_reference",
          "number": 14,
          "failed": true
--
        {
          "name": "reject_throwing_exception_cb",
          "number": 15,
          "failed": true
--
        {
          "name": "reject_exception_throw_cb",
          "number": 19,
          "failed": true
--
        {
          "name": "reject_exception_throw_cb_diff",
          "number": 20,
          "failed": true
--
        {
          "name": "reject_set_exception_cb_bad_ret2",
          "number": 22,
          "failed": true
--
        {
          "name": "check_assert_eq_int_min",
          "number": 23,
          "failed": true
--
        {
          "name": "check_assert_eq_int_max",
          "number": 24,
          "failed": true
--
        {
          "name": "check_assert_eq_zero",
          "number": 25,
          "failed": true
--
        {
          "name": "check_assert_eq_llong_min",
          "number": 26,
          "failed": true
--
        {
          "name": "check_assert_eq_llong_max",
          "number": 27,
          "failed": true
--
        {
          "name": "check_assert_lt_pos",
          "number": 28,
          "failed": true
--
        {
          "name": "check_assert_lt_zero",
          "number": 29,
          "failed": true
--
        {
          "name": "check_assert_lt_neg",
          "number": 30,
          "failed": true
--
        {
          "name": "check_assert_le_pos",
          "number": 31,
          "failed": true
--
        {
          "name": "check_assert_le_zero",
          "number": 32,
          "failed": true
--
        {
          "name": "check_assert_le_neg",
          "number": 33,
          "failed": true
--
        {
          "name": "check_assert_gt_pos",
          "number": 34,
          "failed": true
--
        {
          "name": "check_assert_gt_zero",
          "number": 35,
          "failed": true
--
        {
          "name": "check_assert_gt_neg",
          "number": 36,
          "failed": true
--
        {
          "name": "check_assert_ge_pos",
          "number": 37,
          "failed": true
--
        {
          "name": "check_assert_ge_zero",
          "number": 38,
          "failed": true
--
        {
          "name": "check_assert_ge_neg",
          "number": 39,
          "failed": true
--
        {
          "name": "check_assert_range_s64",
          "number": 40,
          "failed": true
--
        {
          "name": "check_assert_range_u64",
          "number": 41,
          "failed": true
--
        {
          "name": "check_assert_single_range_s64",
          "number": 42,
          "failed": true
--
        {
          "name": "check_assert_single_range_u64",
          "number": 43,
          "failed": true
--
        {
          "name": "check_assert_generic",
          "number": 44,
          "failed": true
--
        {
          "name": "check_assert_with_return",
          "number": 45,
          "failed": true
--
    {
      "name": "fentry_test",
      "number": 109,
      "failed": true,
--
        {
          "name": "fentry_many_args",
          "number": 2,
          "failed": true
--
    {
      "name": "fexit_test",
      "number": 113,
      "failed": true,
--
        {
          "name": "fexit_many_args",
          "number": 2,
          "failed": true
--
    {
      "name": "flow_dissector_classification",
      "number": 117,
      "failed": true,
--
        {
          "name": "ipv4",
          "number": 1,
          "failed": true
--
        {
          "name": "ipv4_continue_dissect",
          "number": 2,
          "failed": true
--
        {
          "name": "ipip",
          "number": 3,
          "failed": true
--
        {
          "name": "gre",
          "number": 4,
          "failed": true
--
        {
          "name": "port_range",
          "number": 5,
          "failed": true
--
        {
          "name": "ipv6",
          "number": 6,
          "failed": true
--
    {
      "name": "global_map_resize",
      "number": 136,
      "failed": true,
--
        {
          "name": "global_map_resize_bss",
          "number": 1,
          "failed": true
--
        {
          "name": "global_map_resize_data",
          "number": 2,
          "failed": true
--
    {
      "name": "hash_large_key",
      "number": 137,
      "failed": true,
--
    {
      "name": "ldsx_insn",
      "number": 162,
      "failed": true,
--
        {
          "name": "map_val and probed_memory",
          "number": 1,
          "failed": true
--
    {
      "name": "libbpf_probe_prog_types",
      "number": 167,
      "failed": true,
--
        {
          "name": "BPF_PROG_TYPE_LIRC_MODE2",
          "number": 20,
          "failed": true
--
    {
      "name": "livepatch_trampoline",
      "number": 175,
      "failed": true,
--
    {
      "name": "lwt_ip_encap_ipv4",
      "number": 184,
      "failed": true,
--
        {
          "name": "egress",
          "number": 1,
          "failed": true
--
        {
          "name": "ingress",
          "number": 2,
          "failed": true
--
    {
      "name": "lwt_ip_encap_ipv6",
      "number": 185,
      "failed": true,
--
        {
          "name": "egress",
          "number": 1,
          "failed": true
--
        {
          "name": "ingress",
          "number": 2,
          "failed": true
--
    {
      "name": "lwt_ip_encap_vrf_ipv4",
      "number": 186,
      "failed": true,
--
        {
          "name": "egress",
          "number": 1,
          "failed": true
--
        {
          "name": "ingress",
          "number": 2,
          "failed": true
--
    {
      "name": "lwt_ip_encap_vrf_ipv6",
      "number": 187,
      "failed": true,
--
        {
          "name": "egress",
          "number": 1,
          "failed": true
--
        {
          "name": "ingress",
          "number": 2,
          "failed": true
--
    {
      "name": "lwt_redirect",
      "number": 188,
      "failed": true,
--
        {
          "name": "lwt_redirect_normal",
          "number": 1,
          "failed": true
--
        {
          "name": "lwt_redirect_normal_nomac",
          "number": 2,
          "failed": true
--
        {
          "name": "lwt_redirect_dev_down",
          "number": 3,
          "failed": true
--
        {
          "name": "lwt_redirect_dev_down_nomac",
          "number": 4,
          "failed": true
--
        {
          "name": "lwt_redirect_dev_carrier_down",
          "number": 5,
          "failed": true
--
    {
      "name": "lwt_reroute",
      "number": 189,
      "failed": true,
--
        {
          "name": "lwt_reroute_normal_xmit",
          "number": 1,
          "failed": true
--
        {
          "name": "lwt_reroute_qdisc_dropped",
          "number": 2,
          "failed": true
--
    {
      "name": "lwt_seg6local",
      "number": 190,
      "failed": true,
--
    {
      "name": "module_attach",
      "number": 207,
      "failed": true,
--
    {
      "name": "module_fentry_shadow",
      "number": 208,
      "failed": true,
--
    {
      "name": "ns_tc_links_dev_chain0",
      "number": 224,
      "failed": true,
--
    {
      "name": "perf_skip",
      "number": 260,
      "failed": true,
--
    {
      "name": "pro_epilogue",
      "number": 271,
      "failed": true,
--
        {
          "name": "syscall_prologue",
          "number": 4,
          "failed": true
--
        {
          "name": "syscall_epilogue",
          "number": 5,
          "failed": true
--
        {
          "name": "syscall_pro_epilogue",
          "number": 6,
          "failed": true
--
        {
          "name": "syscall_prologue_goto_start",
          "number": 10,
          "failed": true
--
        {
          "name": "syscall_epilogue_goto_start",
          "number": 11,
          "failed": true
--
        {
          "name": "syscall_pro_epilogue_goto_start",
          "number": 12,
          "failed": true
--
        {
          "name": "syscall_epilogue_exit0",
          "number": 14,
          "failed": true
--
        {
          "name": "syscall_epilogue_exit1",
          "number": 15,
          "failed": true
--
        {
          "name": "syscall_pro_epilogue",
          "number": 17,
          "failed": true
--
        {
          "name": "tailcall",
          "number": 18,
          "failed": true
--
    {
      "name": "res_spin_lock_failure",
      "number": 361,
      "failed": true,
--
        {
          "name": "res_spin_lock_var_off",
          "number": 12,
          "failed": true
--
    {
      "name": "setget_sockopt",
      "number": 370,
      "failed": true,
--
    {
      "name": "stream_success",
      "number": 413,
      "failed": true,
--
        {
          "name": "stream_deadlock",
          "number": 3,
          "failed": true
--
    {
      "name": "struct_ops_id_ops_mapping",
      "number": 417,
      "failed": true,
--
        {
          "name": "st_ops_id_ops_mapping",
          "number": 1,
          "failed": true
--
    {
      "name": "struct_ops_module",
      "number": 420,
      "failed": true,
--
        {
          "name": "struct_ops_load",
          "number": 1,
          "failed": true
--
        {
          "name": "struct_ops_incompatible",
          "number": 3,
          "failed": true
--
    {
      "name": "struct_ops_multi_pages",
      "number": 421,
      "failed": true,
--
        {
          "name": "multi_pages",
          "number": 1,
          "failed": true
--
    {
      "name": "subprogs_extable",
      "number": 426,
      "failed": true,
--
    {
      "name": "task_local_data",
      "number": 435,
      "failed": true,
--
        {
          "name": "task_local_data_basic",
          "number": 1,
          "failed": true
--
        {
          "name": "task_local_data_race",
          "number": 2,
          "failed": true
--
    {
      "name": "tc_netkit_basic",
      "number": 443,
      "failed": true,
--
    {
      "name": "tc_netkit_device",
      "number": 444,
      "failed": true,
--
    {
      "name": "tc_netkit_multi_links",
      "number": 445,
      "failed": true,
--
    {
      "name": "tc_netkit_multi_opts",
      "number": 446,
      "failed": true,
--
    {
      "name": "tc_netkit_neigh_links",
      "number": 447,
      "failed": true,
--
    {
      "name": "tc_netkit_pkt_type",
      "number": 448,
      "failed": true,
--
    {
      "name": "tc_netkit_scrub",
      "number": 449,
      "failed": true,
--
    {
      "name": "tc_redirect",
      "number": 455,
      "failed": true,
--
        {
          "name": "tc_redirect_peer",
          "number": 2,
          "failed": true
--
        {
          "name": "tc_redirect_peer_l3",
          "number": 4,
          "failed": true
--
    {
      "name": "test_bpffs",
      "number": 456,
      "failed": true,
--
    {
      "name": "test_ima",
      "number": 461,
      "failed": true,
--
    {
      "name": "test_lsm",
      "number": 463,
      "failed": true,
--
        {
          "name": "lsm_basic",
          "number": 1,
          "failed": true
--
    {
      "name": "timer",
      "number": 468,
      "failed": true,
--
    {
      "name": "timer_mim",
      "number": 472,
      "failed": true,
--
    {
      "name": "tracing_struct",
      "number": 481,
      "failed": true,
--
        {
          "name": "struct_args",
          "number": 1,
          "failed": true
--
        {
          "name": "struct_many_args",
          "number": 2,
          "failed": true
--
        {
          "name": "union_args",
          "number": 3,
          "failed": true
--
    {
      "name": "tunnel",
      "number": 483,
      "failed": true,
--
        {
          "name": "vxlan_tunnel",
          "number": 1,
          "failed": true
--
        {
          "name": "ip6vxlan_tunnel",
          "number": 2,
          "failed": true
--
        {
          "name": "ipip_tunnel",
          "number": 3,
          "failed": true
--
        {
          "name": "ipip_tunnel",
          "number": 4,
          "failed": true
--
        {
          "name": "ipip_tunnel",
          "number": 5,
          "failed": true
--
        {
          "name": "xfrm_tunnel",
          "number": 6,
          "failed": true
--
        {
          "name": "gre_tunnel",
          "number": 7,
          "failed": true
--
        {
          "name": "gre_tunnel",
          "number": 8,
          "failed": true
--
        {
          "name": "gre_tunnel",
          "number": 9,
          "failed": true
--
        {
          "name": "gre_tunnel",
          "number": 10,
          "failed": true
--
        {
          "name": "ip6gre_tunnel",
          "number": 11,
          "failed": true
--
        {
          "name": "ip6gre_tunnel",
          "number": 12,
          "failed": true
--
        {
          "name": "erspan_tunnel",
          "number": 13,
          "failed": true
--
        {
          "name": "erspan_tunnel",
          "number": 14,
          "failed": true
--
        {
          "name": "ip6erspan_tunnel",
          "number": 15,
          "failed": true
--
        {
          "name": "ip6erspan_tunnel",
          "number": 16,
          "failed": true
--
        {
          "name": "geneve_tunnel",
          "number": 17,
          "failed": true
--
        {
          "name": "ip6geneve_tunnel",
          "number": 18,
          "failed": true
--
        {
          "name": "ip6tnl_tunnel",
          "number": 19,
          "failed": true
--
        {
          "name": "ip6tnl_tunnel",
          "number": 20,
          "failed": true
--
    {
      "name": "usdt",
      "number": 492,
      "failed": true,
--
        {
          "name": "basic",
          "number": 1,
          "failed": true
--
        {
          "name": "multispec",
          "number": 2,
          "failed": true
--
        {
          "name": "urand_auto_attach",
          "number": 3,
          "failed": true
--
        {
          "name": "urand_pid_attach",
          "number": 4,
          "failed": true
--
    {
      "name": "verifier_bits_iter",
      "number": 501,
      "failed": true,
--
        {
          "name": "max words",
          "number": 12,
          "failed": true
--
    {
      "name": "verifier_bounds",
      "number": 502,
      "failed": true,
--
        {
          "name": "subtraction bounds (map value) variant 2 @unpriv",
          "number": 4,
          "failed": true
--
        {
          "name": "bounds check map access with off+size signed 32bit
overflow. test2 @unpriv",
          "number": 30,
          "failed": true
--
        {
          "name": "bounds check map access with off+size signed 32bit
overflow. test3 @unpriv",
          "number": 32,
          "failed": true
--
    {
      "name": "verifier_bounds_deduction",
      "number": 503,
      "failed": true,
--
        {
          "name": "check deducing bounds from const, 1 @unpriv",
          "number": 2,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 2 @unpriv",
          "number": 4,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 3 @unpriv",
          "number": 6,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 4 @unpriv",
          "number": 8,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 5 @unpriv",
          "number": 10,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 6 @unpriv",
          "number": 12,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 7 @unpriv",
          "number": 14,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 8 @unpriv",
          "number": 16,
          "failed": true
--
        {
          "name": "check deducing bounds from const, 9 @unpriv",
          "number": 18,
          "failed": true
--
    {
      "name": "verifier_direct_stack_access_wraparound",
      "number": 521,
      "failed": true,
--
        {
          "name": "direct stack access with 32-bit wraparound. test3 @unpri=
v",
          "number": 6,
          "failed": true
--
    {
      "name": "verifier_map_ptr",
      "number": 548,
      "failed": true,
--
        {
          "name": "bpf_map_ptr: r =3D 0, map_ptr =3D map_ptr + r @unpriv",
          "number": 10,
          "failed": true
--
        {
          "name": "bpf_map_ptr: r =3D 0, r =3D r + map_ptr @unpriv",
          "number": 12,
          "failed": true
--
    {
      "name": "verifier_map_ptr_mixing",
      "number": 549,
      "failed": true,
--
        {
          "name": "cond: two branches returning different map pointers
for lookup (tail, tail) @unpriv",
          "number": 2,
          "failed": true
--
    {
      "name": "verifier_runtime_jit",
      "number": 570,
      "failed": true,
--
        {
          "name": "runtime/jit: tail_call within bounds, different
maps, first branch @unpriv",
          "number": 18,
          "failed": true
--
        {
          "name": "runtime/jit: tail_call within bounds, different
maps, second branch @unpriv",
          "number": 20,
          "failed": true
--
        {
          "name": "runtime/jit: pass > 32bit index to tail_call @unpriv",
          "number": 26,
          "failed": true
--
    {
      "name": "verifier_scalar_ids",
      "number": 571,
      "failed": true,
--
        {
          "name": "linked_regs_and_subreg_def",
          "number": 18,
          "failed": true
--
    {
      "name": "verifier_stack_ptr",
      "number": 579,
      "failed": true,
--
        {
          "name": "PTR_TO_STACK store/load - out of bounds low @unpriv",
          "number": 8,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check high 3 @unpriv",
          "number": 16,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check high 4 @unpriv",
          "number": 18,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check high 5 @unpriv",
          "number": 20,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check high 6 @unpriv",
          "number": 22,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check high 7 @unpriv",
          "number": 24,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check low 2 @unpriv",
          "number": 28,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check low 3 @unpriv",
          "number": 30,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check low 5 @unpriv",
          "number": 34,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check low 6 @unpriv",
          "number": 36,
          "failed": true
--
        {
          "name": "PTR_TO_STACK check low 7 @unpriv",
          "number": 38,
          "failed": true
--
    {
      "name": "verifier_unpriv",
      "number": 587,
      "failed": true,
--
        {
          "name": "unpriv: adding of fp, reg @unpriv",
          "number": 46,
          "failed": true
--
        {
          "name": "unpriv: adding of fp, imm @unpriv",
          "number": 48,
          "failed": true
--
    {
      "name": "verifier_value_ptr_arith",
      "number": 593,
      "failed": true,
--
        {
          "name": "map access: known scalar +=3D value_ptr unknown vs
const @unpriv",
          "number": 2,
          "failed": true
--
        {
          "name": "map access: known scalar +=3D value_ptr const vs
unknown @unpriv",
          "number": 4,
          "failed": true
--
        {
          "name": "map access: known scalar +=3D value_ptr const vs
const (ne) @unpriv",
          "number": 6,
          "failed": true
--
        {
          "name": "map access: known scalar +=3D value_ptr unknown vs
unknown (lt) @unpriv",
          "number": 12,
          "failed": true
--
        {
          "name": "map access: known scalar +=3D value_ptr unknown vs
unknown (gt) @unpriv",
          "number": 14,
          "failed": true
--
        {
          "name": "map access: value_ptr -=3D known scalar from
different maps @unpriv",
          "number": 18,
          "failed": true
--
        {
          "name": "map access: mixing value pointer and scalar, 1 @unpriv",
          "number": 22,
          "failed": true
--
        {
          "name": "map access: mixing value pointer and scalar, 2 @unpriv",
          "number": 24,
          "failed": true
--
        {
          "name": "map access: value_ptr +=3D known scalar, upper oob
arith, test 1 @unpriv",
          "number": 32,
          "failed": true
--
        {
          "name": "map access: value_ptr +=3D known scalar, upper oob
arith, test 2 @unpriv",
          "number": 34,
          "failed": true
--
        {
          "name": "map access: value_ptr -=3D known scalar, lower oob
arith, test 1 @unpriv",
          "number": 38,
          "failed": true
--
        {
          "name": "map access: value_ptr -=3D known scalar, lower oob
arith, test 2 @unpriv",
          "number": 40,
          "failed": true
--
        {
          "name": "map access: unknown scalar +=3D value_ptr, 3 @unpriv",
          "number": 64,
          "failed": true
--
        {
          "name": "map access: unknown scalar +=3D value_ptr, 4 @unpriv",
          "number": 66,
          "failed": true
--
    {
      "name": "verifier_var_off",
      "number": 594,
      "failed": true,
--
        {
          "name": "variable-offset stack read, priv vs unpriv @unpriv",
          "number": 6,
          "failed": true
--
        {
          "name": "variable-offset stack read, uninitialized @unpriv",
          "number": 8,
          "failed": true
--
        {
          "name": "indirect variable-offset stack access, min_off <
min_initialized @unpriv",
          "number": 10,
          "failed": true
--
        {
          "name": "indirect variable-offset stack access, priv vs
unpriv @unpriv",
          "number": 12,
          "failed": true
--
        {
          "name": "variable-offset stack write, priv vs unpriv @unpriv",
          "number": 14,
          "failed": true
--
        {
          "name": "variable-offset stack write followed by read @unpriv",
          "number": 16,
          "failed": true
--
        {
          "name": "variable-offset stack write clobbers spilled regs @unpri=
v",
          "number": 18,
          "failed": true
--
    {
      "name": "verif_scale_pyperf600",
      "number": 612,
      "failed": true,
--
    {
      "name": "verif_scale_seg6_loop",
      "number": 618,
      "failed": true,
--
    {
      "name": "vmlinux",
      "number": 631,
      "failed": true,
--
    {
      "name": "vrf_socket_lookup",
      "number": 632,
      "failed": true,
--
    {
      "name": "wq",
      "number": 633,
      "failed": true,
--
        {
          "name": "test_call_array_sleepable",
          "number": 1,
          "failed": true
--
        {
          "name": "test_call_hash_sleepable",
          "number": 2,
          "failed": true
--
        {
          "name": "test_call_hash_malloc_sleepable",
          "number": 3,
          "failed": true
--
        {
          "name": "test_call_lru_sleepable",
          "number": 4,
          "failed": true
--
        {
          "name": "test_syscall_array_sleepable",
          "number": 5,
          "failed": true
--
    {
      "name": "xdp_adjust_tail",
      "number": 636,
      "failed": true,
--
        {
          "name": "xdp_adjust_tail_grow",
          "number": 2,
          "failed": true
--
        {
          "name": "xdp_adjust_frags_tail_grow",
          "number": 5,
          "failed": true
--
    {
      "name": "xdp_context_tuntap",
      "number": 641,
      "failed": true,
--
        {
          "name": "clone_data_meta_empty_on_data_write",
          "number": 8,
          "failed": true
--
        {
          "name": "clone_data_meta_empty_on_meta_write",
          "number": 9,
          "failed": true
--
        {
          "name": "clone_dynptr_empty_on_data_slice_write",
          "number": 10,
          "failed": true
--
        {
          "name": "clone_dynptr_empty_on_meta_slice_write",
          "number": 11,
          "failed": true
--
        {
          "name": "clone_dynptr_rdonly_before_data_dynptr_write",
          "number": 12,
          "failed": true
--
        {
          "name": "clone_dynptr_rdonly_before_meta_dynptr_write",
          "number": 13,
          "failed": true
--
    {
      "name": "xdp_do_redirect",
      "number": 646,
      "failed": true,
--
    {
      "name": "xdp_flowtable",
      "number": 647,
      "failed": true,
--
    {
      "name": "xdp_pull_data",
      "number": 654,
      "failed": true,
--
        {
          "name": "xdp_pull_data",
          "number": 1,
          "failed": true
--
    {
      "name": "xdp_synproxy",
      "number": 655,
      "failed": true,
--
        {
          "name": "xdp",
          "number": 1,
          "failed": true
--
        {
          "name": "tc",
          "number": 2,
          "failed": true
--
    {
      "name": "xfrm_info",
      "number": 662,
      "failed": true,
[root@fedora bpf]#

> --
> 2.43.5
