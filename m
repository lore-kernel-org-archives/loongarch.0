Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283E3A1E63
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 21:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767044950; cv=none; b=qhLZsAPC0GajVjWHDfaFkGBjtp2ZOY4fu9if4xYYPhHu1IpcRhzDEL0B9UvwZdK8nXz5cr88ik69KJdUQdKVsXt22A7DZKLYZhyZmWl3PTaUbB5IroVRjwBaBG5/Ji7C5h1qCtCHEJNOreNd/Nl3S1HXQhKYSH8IS3eZvsGoXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767044950; c=relaxed/simple;
	bh=OpfNKjPIxlMRmg/5PU3PYNDFiRyrG5IOYCqBWOw8euE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=flLSqqdSwSVn1R1c4fNfuKXVjVXLUcPT43NIZcCVMKbbO/tf6JM//rYjBNczyeKFiifzXBIIbaUhiUkHWxvpmW0hhFbSN2d3AHn7EkFQWNXRTl17mZSHAa6ru2lAl+4MLDyMgii5JhdcjP3FbYAOv5mwLpZQie0jI9u6/qpKPAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N50oXRck; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N50oXRck"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4eda057f3c0so106847221cf.2
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 13:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767044945; x=1767649745; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdwjJETPptznBVfnx4lvmMcZt8U/2czzt29vZmZ7W/o=;
        b=N50oXRckOVpURXWIeRzm7ezAlsuxHIeG6LLoRcz2y/eGEEdspvMTad6+r20MreVQa2
         X2vqBiUfdEQ4x5L3cIc/HGkEetToXP16g0hCRFxDLd67Z/aFsUaAGERi3I7ZPdWFow3U
         kUcXIY+SQHtD7d6Fe9VAZrtMuzkPT0c/Ao0BTjjoYye0u0x10heh4fyqO0BQS/UDqCYy
         ctUACeixCq8IBP91vK7Pe2o5a3z5msu7Y5T/u1fP6GPjyGJPuU7y/YBB+Cx3fFcAlhfe
         G8gljhW7KSzS1hPLXagcKKs1ZnXeMVI7g186UoUHPE2OMfMCfMJL31BzbAX+I7mIEzFR
         dFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767044945; x=1767649745;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdwjJETPptznBVfnx4lvmMcZt8U/2czzt29vZmZ7W/o=;
        b=TF2WJsT54sC6orpYTshrN8e1PySFptc+pv9Xaf4YgGaVDalqKSpvW3M/8UpVgpL4EV
         cyRnOkSntLOZ5mNRDzT4rkSlEJl2YzFH8PBqB6CrqaJm+MfM9BikarYyn3OBMetCXp4F
         rXu1hBQx8/gUelWaOcLmp/rb938Fap/oc6rcxlsWBVKByNKChEqAbZuVRp6eQosTc23W
         cGcItia7DP6Y57Sf/wShbdufuHDSNabD2rn5GFpeYe6zlOPJqg53vOJvRk6BABGOHxZ3
         Jbig/fRmXkl/velu1zawNnqQcmGAVt18YeXthSoSRLa678oRMDwecs4aXVPCgHoixCiq
         lkGw==
X-Forwarded-Encrypted: i=1; AJvYcCWyuVk4nKZWW96wCjGvRsdYKeD8JLzd+cyAnqsc1NARGYkEWsvBxZjrIpIwEct8XDVJIHSWjFkgGiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgQOYX5ARYebsBB6GeZFgc7Utv69yraWVD2coepFc+YvlPrpwr
	LMg5sswA6P60aohEj9mZkZ3UAfkd4hYvPyxorx87EYp2xSzUq7xQ1t9MVMwRa2j5MMpZ8nuJaNY
	wt9fi3DYMQspYxYeoL2UToI3s9prCC4c=
X-Gm-Gg: AY/fxX4KkHbOLqepseA2azewVQGnSN0Vk9GxUz62Z4Djp3Muud/+F/j+Cwf0NVmLhxo
	rtx3yV+fh5Tjxip17eWUantDqRcF5DbVxgow3T1QBRjFv5ITjX0XQivlRLBbSOtr7cNyz+fw57g
	OMs8jQXddlIMhnXidrbarMd4lsBH5hWOWq/VF2QIS+FYLq9N3C4o3fQmmSvNU/OEVdeoi1H2xQA
	AVsiyF1t38iT4F9Y5hyeaY4gl+NCpiG3zQZogdXIsqmRUeWehAIAB1FADaUvPPwyZWT6No=
X-Google-Smtp-Source: AGHT+IHRGChZdcxtaLLluo+ZoN6qGpS7vMOj5xacF3y7aWePVqXBk12iThHRO92ThEytFVomgPnnTcGTGfpVD+WwgGs=
X-Received: by 2002:a05:622a:2b04:b0:4de:cb90:dbe4 with SMTP id
 d75a77b69052e-4f4abd944c7mr457714911cf.66.1767044945190; Mon, 29 Dec 2025
 13:49:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
In-Reply-To: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 29 Dec 2025 13:48:54 -0800
X-Gm-Features: AQt7F2pVaJ79XbPqkA-0ExOfQpLbKDwMhHDUY-dVK6nDyL8TMNa3bRRj2gyS3xQ
Message-ID: <CAK3+h2xAwbrKcPY9uzWbEekFcHkOw9qUjP51P2_YeUVVurtcGw@mail.gmail.com>
Subject: Re: x86 bpf selftests report for reference
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 1:27=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> Hi Huacai,
>
> I did a manual full bpf selftests on x86 machine, no ns_bpf_qdisc
> failure, so indeed like you said, it seems loongarch bpf is
> deteriorating. Here is x86 failed bpf test report for reference, there
> is no hang up or anything like that during the test.
>
> root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf#test_progs
> --json-summary=3D"./bpf_selftests.json"
>
> root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf#cat
> bpf_selftests.json | jq . | grep -B4 '"failed": true'  | grep -v
> '"message":'
>     {
>       "name": "bpf_cookie",
>       "number": 19,
>       "failed": true,
> --
>         {
>           "name": "lsm",
>           "number": 9,
>           "failed": true
> --
>     {
>       "name": "cgroup1_hierarchy",
>       "number": 52,
>       "failed": true,
> --
>         {
>           "name": "test_cgroup1_hierarchy",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "test_invalid_level",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "test_invalid_cgid",
>           "number": 4,
>           "failed": true
> --
>         {
>           "name": "test_invalid_hid",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "test_invalid_cgrp_name",
>           "number": 6,
>           "failed": true
> --
>         {
>           "name": "test_invalid_cgrp_name2",
>           "number": 7,
>           "failed": true
> --
>     {
>       "name": "cgroup_tcp_skb",
>       "number": 69,
>       "failed": true,
> --
>     {
>       "name": "cgroup_xattr",
>       "number": 71,
>       "failed": true,
> --
>         {
>           "name": "read_cgroupfs_xattr",
>           "number": 8,
>           "failed": true
> --
>     {
>       "name": "deny_namespace",
>       "number": 96,
>       "failed": true,
> --
>         {
>           "name": "userns_create_bpf",
>           "number": 2,
>           "failed": true
> --
>     {
>       "name": "exceptions",
>       "number": 104,
>       "failed": true,
> --
>         {
>           "name": "reject_exception_cb_type_1",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "reject_exception_cb_type_2",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "reject_exception_cb_type_3",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "reject_exception_cb_type_4",
>           "number": 4,
>           "failed": true
> --
>         {
>           "name": "reject_async_callback_throw",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "reject_with_rcu_read_lock",
>           "number": 8,
>           "failed": true
> --
>         {
>           "name": "reject_subprog_with_rcu_read_lock",
>           "number": 9,
>           "failed": true
> --
>         {
>           "name": "reject_with_reference",
>           "number": 11,
>           "failed": true
> --
>         {
>           "name": "reject_with_cb_reference",
>           "number": 12,
>           "failed": true
> --
>         {
>           "name": "reject_with_cb",
>           "number": 13,
>           "failed": true
> --
>         {
>           "name": "reject_with_subprog_reference",
>           "number": 14,
>           "failed": true
> --
>         {
>           "name": "reject_throwing_exception_cb",
>           "number": 15,
>           "failed": true
> --
>         {
>           "name": "reject_exception_throw_cb",
>           "number": 19,
>           "failed": true
> --
>         {
>           "name": "reject_exception_throw_cb_diff",
>           "number": 20,
>           "failed": true
> --
>         {
>           "name": "reject_set_exception_cb_bad_ret2",
>           "number": 22,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_int_min",
>           "number": 23,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_int_max",
>           "number": 24,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_zero",
>           "number": 25,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_llong_min",
>           "number": 26,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_llong_max",
>           "number": 27,
>           "failed": true
> --
>         {
>           "name": "check_assert_lt_pos",
>           "number": 28,
>           "failed": true
> --
>         {
>           "name": "check_assert_lt_zero",
>           "number": 29,
>           "failed": true
> --
>         {
>           "name": "check_assert_lt_neg",
>           "number": 30,
>           "failed": true
> --
>         {
>           "name": "check_assert_le_pos",
>           "number": 31,
>           "failed": true
> --
>         {
>           "name": "check_assert_le_zero",
>           "number": 32,
>           "failed": true
> --
>         {
>           "name": "check_assert_le_neg",
>           "number": 33,
>           "failed": true
> --
>         {
>           "name": "check_assert_gt_pos",
>           "number": 34,
>           "failed": true
> --
>         {
>           "name": "check_assert_gt_zero",
>           "number": 35,
>           "failed": true
> --
>         {
>           "name": "check_assert_gt_neg",
>           "number": 36,
>           "failed": true
> --
>         {
>           "name": "check_assert_ge_pos",
>           "number": 37,
>           "failed": true
> --
>         {
>           "name": "check_assert_ge_zero",
>           "number": 38,
>           "failed": true
> --
>         {
>           "name": "check_assert_ge_neg",
>           "number": 39,
>           "failed": true
> --
>         {
>           "name": "check_assert_range_s64",
>           "number": 40,
>           "failed": true
> --
>         {
>           "name": "check_assert_range_u64",
>           "number": 41,
>           "failed": true
> --
>         {
>           "name": "check_assert_single_range_s64",
>           "number": 42,
>           "failed": true
> --
>         {
>           "name": "check_assert_single_range_u64",
>           "number": 43,
>           "failed": true
> --
>         {
>           "name": "check_assert_generic",
>           "number": 44,
>           "failed": true
> --
>         {
>           "name": "check_assert_with_return",
>           "number": 45,
>           "failed": true
> --
>     {
>       "name": "fexit_stress",
>       "number": 115,
>       "failed": true,
> --
>     {
>       "name": "file_reader",
>       "number": 118,
>       "failed": true,
> --
>         {
>           "name": "on_open_expect_fault",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "on_open_validate_file_read",
>           "number": 2,
>           "failed": true
> --
>     {
>       "name": "fs_kfuncs",
>       "number": 130,
>       "failed": true,
> --
>         {
>           "name": "user_xattr",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "security_bpf_xattr",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "set_remove_xattr",
>           "number": 5,
>           "failed": true
> --
>     {
>       "name": "get_branch_snapshot",
>       "number": 131,
>       "failed": true,
> --
>     {
>       "name": "iters",
>       "number": 148,
>       "failed": true,
> --
>         {
>           "name": "css_task",
>           "number": 85,
>           "failed": true
> --
>     {
>       "name": "kernel_flag",
>       "number": 151,
>       "failed": true,
> --
>     {
>       "name": "kfunc_dynptr_param",
>       "number": 154,
>       "failed": true,
> --
>         {
>           "name": "dynptr_data_null",
>           "number": 1,
>           "failed": true
> --
>     {
>       "name": "libbpf_get_fd_by_id_opts",
>       "number": 168,
>       "failed": true,
> --
>     {
>       "name": "lookup_key",
>       "number": 185,
>       "failed": true,
> --
>     {
>       "name": "lsm_cgroup",
>       "number": 187,
>       "failed": true,
> --
>         {
>           "name": "functional",
>           "number": 1,
>           "failed": true
> --
>     {
>       "name": "migrate_reuseport",
>       "number": 206,
>       "failed": true,
> --
>         {
>           "name": "IPv4 TCP_SYN_RECV     inet_csk_listen_stop",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "IPv4 TCP_NEW_SYN_RECV reqsk_timer_handler",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "IPv4 TCP_NEW_SYN_RECV inet_csk_complete_hashdance",
>           "number": 4,
>           "failed": true
> --
>         {
>           "name": "IPv6 TCP_SYN_RECV     inet_csk_listen_stop",
>           "number": 6,
>           "failed": true
> --
>         {
>           "name": "IPv6 TCP_NEW_SYN_RECV reqsk_timer_handler",
>           "number": 7,
>           "failed": true
> --
>         {
>           "name": "IPv6 TCP_NEW_SYN_RECV inet_csk_complete_hashdance",
>           "number": 8,
>           "failed": true
> --
>     {
>       "name": "ptr_untrusted",
>       "number": 284,
>       "failed": true,
> --
>     {
>       "name": "res_spin_lock_failure",
>       "number": 369,
>       "failed": true,
> --
>         {
>           "name": "res_spin_lock_var_off",
>           "number": 12,
>           "failed": true
> --
>     {
>       "name": "send_signal",
>       "number": 376,
>       "failed": true,
> --
>         {
>           "name": "send_signal_perf",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "send_signal_perf_thread",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi_thread",
>           "number": 6,
>           "failed": true
> --
>         {
>           "name": "send_signal_perf_remote",
>           "number": 8,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi_remote",
>           "number": 9,
>           "failed": true
> --
>         {
>           "name": "send_signal_perf_thread_remote",
>           "number": 11,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi_thread_remote",
>           "number": 12,
>           "failed": true
> --
>     {
>       "name": "setget_sockopt",
>       "number": 378,
>       "failed": true,
> --
>     {
>       "name": "sk_assign",
>       "number": 381,
>       "failed": true,
> --
>     {
>       "name": "sockmap_basic",
>       "number": 399,
>       "failed": true,
> --
>         {
>           "name": "sockmap vsock delete on close",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "sockmap skb_verdict vsock poll",
>           "number": 29,
>           "failed": true
> --
>     {
>       "name": "sockmap_listen",
>       "number": 401,
>       "failed": true,
> --
>         {
>           "name": "sockmap IPv4 TCP test_reuseport_select_listening",
>           "number": 33,
>           "failed": true
> --
>         {
>           "name": "sockmap IPv6 TCP test_reuseport_select_listening",
>           "number": 71,
>           "failed": true
> --
>         {
>           "name": "sockhash IPv4 TCP test_reuseport_select_listening",
>           "number": 109,
>           "failed": true
> --
>         {
>           "name": "sockhash IPv6 TCP test_reuseport_select_listening",
>           "number": 147,
>           "failed": true
> --
>     {
>       "name": "sockmap_redir",
>       "number": 402,
>       "failed": true,
> --
>     {
>       "name": "stream_success",
>       "number": 422,
>       "failed": true,
> --
>         {
>           "name": "stream_cond_break",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "stream_deadlock",
>           "number": 3,
>           "failed": true
> --
>     {
>       "name": "tcpbpf_user",
>       "number": 460,
>       "failed": true,
> --
>     {
>       "name": "test_bpffs",
>       "number": 467,
>       "failed": true,
> --
>     {
>       "name": "test_bprm_opts",
>       "number": 469,
>       "failed": true,
> --
>     {
>       "name": "test_ima",
>       "number": 472,
>       "failed": true,
> --
>     {
>       "name": "test_local_storage",
>       "number": 473,
>       "failed": true,
> --
>     {
>       "name": "test_lsm",
>       "number": 474,
>       "failed": true,
> --
>         {
>           "name": "lsm_basic",
>           "number": 1,
>           "failed": true
> --
>     {
>       "name": "token",
>       "number": 485,
>       "failed": true,
> --
>         {
>           "name": "obj_priv_prog",
>           "number": 5,
>           "failed": true
> --
>     {
>       "name": "unpriv_bpf_disabled",
>       "number": 498,
>       "failed": true,
> --
>     {
>       "name": "verifier_private_stack",
>       "number": 576,
>       "failed": true,
> --
>         {
>           "name": "Private stack, exception in main prog",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "Private stack, exception in subprog",
>           "number": 6,
>           "failed": true
> --
>     {
>       "name": "verif_scale_pyperf600",
>       "number": 625,
>       "failed": true,
> --
>     {
>       "name": "verify_pkcs7_sig",
>       "number": 642,
>       "failed": true,
> --
>         {
>           "name": "pkcs7_sig_from_map",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "pkcs7_sig_fsverity",
>           "number": 2,
>           "failed": true

and here is a typical bpf network related self test xdp_synproxy
result on x86 and loongarch64 machine, note I never had xdp_synproxy
self test success since I started testing loongarch64 bpf test that is
almost a year ago on my 3A6000 NUC with stmmac, the recent observation
is that xdp_synproxy would fail to pass the test, but it did not hang
up, now xdp_synproxy test started hang up, other network related bpf
self test like ns_bpf_qdisc shows similar symptom.

x86:

root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf# ./test_progs -t
xdp_synproxy
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]
tx-udp-segmentation: off [not requested]
tx-checksum-sctp: off
net.ipv4.tcp_syncookies =3D 2
net.ipv4.tcp_timestamps =3D 1
net.netfilter.nf_conntrack_tcp_loose =3D 0
Replacing allowed ports
Added port 8080
Replacing TCP/IP options
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]
tx-udp-segmentation: off [not requested]
tx-checksum-sctp: off
net.ipv4.tcp_syncookies =3D 2
net.ipv4.tcp_timestamps =3D 1
net.netfilter.nf_conntrack_tcp_loose =3D 0
Replacing allowed ports
Added port 8080
Replacing TCP/IP options
#669/1   xdp_synproxy/xdp:OK
#669/2   xdp_synproxy/tc:OK
#669     xdp_synproxy:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED
root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf# ./test_progs -t
xdp_synproxy -vvv
bpf_testmod.ko is already unloaded.
Loading bpf_testmod.ko...
Successfully loaded bpf_testmod.ko.
test_synproxy:PASS:ip netns add synproxy 0 nsec
test_synproxy:PASS:ip link add tmp0 type veth peer name tmp1 0 nsec
test_synproxy:PASS:ip link set tmp1 netns synproxy 0 nsec
test_synproxy:PASS:ip link set tmp0 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.1/24 dev tmp0 0 nsec
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]
tx-udp-segmentation: off [not requested]
tx-checksum-sctp: off
test_synproxy:PASS:ethtool -K tmp0 tx off 0 nsec
test_synproxy:PASS:ip link set tmp0 xdp object xdp_dummy.bpf.o section
xdp 2> /dev/null 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:ip link set lo up 0 nsec
test_synproxy:PASS:ip link set tmp1 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.2/24 dev tmp1 0 nsec
net.ipv4.tcp_syncookies =3D 2
test_synproxy:PASS:sysctl -w net.ipv4.tcp_syncookies=3D2 0 nsec
net.ipv4.tcp_timestamps =3D 1
test_synproxy:PASS:sysctl -w net.ipv4.tcp_timestamps=3D1 0 nsec
net.netfilter.nf_conntrack_tcp_loose =3D 0
test_synproxy:PASS:sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0 0 nse=
c
test_synproxy:PASS:iptables-legacy -t raw -I PREROUTING     -i tmp1 -p
tcp -m tcp --syn --dport 8080 -j CT --notrack 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -p
tcp -m tcp --dport 8080 -m state --state INVALID,UNTRACKED     -j
SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -m
state --state INVALID -j DROP 0 nsec
test_synproxy:PASS:./xdp_synproxy --iface tmp1 --ports 8080
--single --mss4 1460 --mss6 1440     --wscale 7 --ttl 64 0 nsec
Replacing allowed ports
Added port 8080
Replacing TCP/IP options
expect_str:PASS:initial SYNACKs 0 nsec
test_synproxy:PASS:start_server 0 nsec
test_synproxy:PASS:connect_to_fd 0 nsec
test_synproxy:PASS:accept 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:./xdp_synproxy --iface tmp1 --single 0 nsec
expect_str:PASS:SYNACKs after connection 0 nsec
#669/1   xdp_synproxy/xdp:OK
test_synproxy:PASS:ip netns add synproxy 0 nsec
test_synproxy:PASS:ip link add tmp0 type veth peer name tmp1 0 nsec
test_synproxy:PASS:ip link set tmp1 netns synproxy 0 nsec
test_synproxy:PASS:ip link set tmp0 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.1/24 dev tmp0 0 nsec
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]
tx-udp-segmentation: off [not requested]
tx-checksum-sctp: off
test_synproxy:PASS:ethtool -K tmp0 tx off 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:ip link set lo up 0 nsec
test_synproxy:PASS:ip link set tmp1 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.2/24 dev tmp1 0 nsec
net.ipv4.tcp_syncookies =3D 2
test_synproxy:PASS:sysctl -w net.ipv4.tcp_syncookies=3D2 0 nsec
net.ipv4.tcp_timestamps =3D 1
test_synproxy:PASS:sysctl -w net.ipv4.tcp_timestamps=3D1 0 nsec
net.netfilter.nf_conntrack_tcp_loose =3D 0
test_synproxy:PASS:sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0 0 nse=
c
test_synproxy:PASS:iptables-legacy -t raw -I PREROUTING     -i tmp1 -p
tcp -m tcp --syn --dport 8080 -j CT --notrack 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -p
tcp -m tcp --dport 8080 -m state --state INVALID,UNTRACKED     -j
SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -m
state --state INVALID -j DROP 0 nsec
test_synproxy:PASS:./xdp_synproxy --iface tmp1 --ports 8080
--single --mss4 1460 --mss6 1440     --wscale 7 --ttl 64 --tc 0 nsec
Replacing allowed ports
Added port 8080
Replacing TCP/IP options
expect_str:PASS:initial SYNACKs 0 nsec
test_synproxy:PASS:tc filter show dev tmp1 ingress 0 nsec
test_synproxy:PASS:find prog id 0 nsec
test_synproxy:PASS:find prog id begin 0 nsec
test_synproxy:PASS:find prog id end 0 nsec
test_synproxy:PASS:start_server 0 nsec
test_synproxy:PASS:connect_to_fd 0 nsec
test_synproxy:PASS:accept 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:./xdp_synproxy --prog 55370 --single 0 nsec
expect_str:PASS:SYNACKs after connection 0 nsec
#669/2   xdp_synproxy/tc:OK
#669     xdp_synproxy:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED
Successfully unloaded bpf_testmod.ko.

loongarch64(hangup) :

[root@fedora bpf]# ./test_progs -t xdp_synproxy -vvv
bpf_testmod.ko is already unloaded.
Loading bpf_testmod.ko...
Successfully loaded bpf_testmod.ko.
test_synproxy:PASS:ip netns add synproxy 0 nsec
test_synproxy:PASS:ip link add tmp0 type veth peer name tmp1 0 nsec
test_synproxy:PASS:ip link set tmp1 netns synproxy 0 nsec
test_synproxy:PASS:ip link set tmp0 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.1/24 dev tmp0 0 nsec
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]
tx-udp-segmentation: off [not requested]
tx-checksum-sctp: off
test_synproxy:PASS:ethtool -K tmp0 tx off 0 nsec
test_synproxy:PASS:ip link set tmp0 xdp object xdp_dummy.bpf.o section
xdp 2> /dev/null 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:ip link set lo up 0 nsec
test_synproxy:PASS:ip link set tmp1 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.2/24 dev tmp1 0 nsec
net.ipv4.tcp_syncookies =3D 2
test_synproxy:PASS:sysctl -w net.ipv4.tcp_syncookies=3D2 0 nsec
net.ipv4.tcp_timestamps =3D 1
test_synproxy:PASS:sysctl -w net.ipv4.tcp_timestamps=3D1 0 nsec
net.netfilter.nf_conntrack_tcp_loose =3D 0
test_synproxy:PASS:sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0 0 nse=
c
test_synproxy:PASS:iptables-legacy -t raw -I PREROUTING     -i tmp1 -p
tcp -m tcp --syn --dport 8080 -j CT --notrack 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -p
tcp -m tcp --dport 8080 -m state --state INVALID,UNTRACKED     -j
SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -m
state --state INVALID -j DROP 0 nsec
test_synproxy:PASS:./xdp_synproxy --iface tmp1 --ports 8080
--single --mss4 1460 --mss6 1440     --wscale 7 --ttl 64 0 nsec
Replacing allowed ports
Added port 8080
Replacing TCP/IP options
expect_str:PASS:initial SYNACKs 0 nsec
test_synproxy:PASS:start_server 0 nsec
test_synproxy:PASS:connect_to_fd 0 nsec
test_synproxy:PASS:accept 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:./xdp_synproxy --iface tmp1 --single 0 nsec
expect_str:PASS:SYNACKs after connection 0 nsec
#653/1   xdp_synproxy/xdp:OK
test_synproxy:PASS:ip netns add synproxy 0 nsec
test_synproxy:PASS:ip link add tmp0 type veth peer name tmp1 0 nsec
test_synproxy:PASS:ip link set tmp1 netns synproxy 0 nsec
test_synproxy:PASS:ip link set tmp0 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.1/24 dev tmp0 0 nsec
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]
tx-udp-segmentation: off [not requested]
tx-checksum-sctp: off
test_synproxy:PASS:ethtool -K tmp0 tx off 0 nsec
test_synproxy:PASS:setns 0 nsec
test_synproxy:PASS:ip link set lo up 0 nsec
test_synproxy:PASS:ip link set tmp1 up 0 nsec
test_synproxy:PASS:ip addr replace 198.18.0.2/24 dev tmp1 0 nsec
net.ipv4.tcp_syncookies =3D 2
test_synproxy:PASS:sysctl -w net.ipv4.tcp_syncookies=3D2 0 nsec
net.ipv4.tcp_timestamps =3D 1
test_synproxy:PASS:sysctl -w net.ipv4.tcp_timestamps=3D1 0 nsec
net.netfilter.nf_conntrack_tcp_loose =3D 0
test_synproxy:PASS:sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0 0 nse=
c
test_synproxy:PASS:iptables-legacy -t raw -I PREROUTING     -i tmp1 -p
tcp -m tcp --syn --dport 8080 -j CT --notrack 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -p
tcp -m tcp --dport 8080 -m state --state INVALID,UNTRACKED     -j
SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460 0 nsec
test_synproxy:PASS:iptables-legacy -t filter -A INPUT     -i tmp1 -m
state --state INVALID -j DROP 0 nsec
test_synproxy:PASS:./xdp_synproxy --iface tmp1 --ports 8080
--single --mss4 1460 --mss6 1440     --wscale 7 --ttl 64 --tc 0 nsec
Replacing allowed ports
Added port 8080
Replacing TCP/IP options
expect_str:PASS:initial SYNACKs 0 nsec
test_synproxy:PASS:tc filter show dev tmp1 ingress 0 nsec
libbpf: loading object 'tc_bpf' from buffer
libbpf: elf: section(2) .symtab, size 168, link 1, flags 0, type=3D2
libbpf: elf: section(3) tc, size 144, link 0, flags 6, type=3D1
libbpf: sec 'tc': found program 'tc_ingress' at insn offset 0 (0
bytes), code size 18 insns (144 bytes)
libbpf: elf: section(4) .rodata, size 36, link 0, flags 2, type=3D1
libbpf: elf: section(5) license, size 4, link 0, flags 3, type=3D1
libbpf: license of tc_bpf is GPL
libbpf: elf: section(6) .reltc, size 16, link 2, flags 40, type=3D9
libbpf: elf: section(7) .BTF, size 2108, link 0, flags 0, type=3D1
libbpf: elf: section(8) .BTF.ext, size 284, link 0, flags 0, type=3D1
libbpf: looking for externs among 7 symbols...
libbpf: collected 0 externs total
libbpf: map 'tc_bpf.rodata' (global data): at sec_idx 4, offset 0, flags 80=
.
libbpf: map 0 is "tc_bpf.rodata"
libbpf: sec '.reltc': collecting relocation for section(3) 'tc'
libbpf: sec '.reltc': relo #0: insn #12 against '.rodata'
libbpf: prog 'tc_ingress': found data map 0 (tc_bpf.rodata, sec 4, off
0) for insn 12
libbpf: object 'tc_bpf': failed (-95) to create BPF token from
'/sys/fs/bpf', skipping optional step...
libbpf: loaded kernel BTF from '/sys/kernel/btf/vmlinux'
libbpf: sec 'tc': found 5 CO-RE relocations
libbpf: CO-RE relocating [2] struct __sk_buff: found target candidate
[10500] struct __sk_buff in [vmlinux]
libbpf: prog 'tc_ingress': relo #0: <byte_off> [2] struct
__sk_buff.protocol (0:4 @ offset 16)
libbpf: prog 'tc_ingress': relo #0: matching candidate #0 <byte_off>
[10500] struct __sk_buff.protocol (0:4 @ offset 16)
libbpf: prog 'tc_ingress': relo #0: patched insn #0 (LDX/ST/STX) off 16 -> =
16
libbpf: prog 'tc_ingress': relo #1: <byte_off> [2] struct
__sk_buff.data (0:15 @ offset 76)
libbpf: prog 'tc_ingress': relo #1: matching candidate #0 <byte_off>
[10500] struct __sk_buff.data (0:15 @ offset 76)
libbpf: prog 'tc_ingress': relo #1: patched insn #2 (LDX/ST/STX) off 76 -> =
76
libbpf: prog 'tc_ingress': relo #2: <byte_off> [2] struct
__sk_buff.data_end (0:16 @ offset 80)
libbpf: prog 'tc_ingress': relo #2: matching candidate #0 <byte_off>
[10500] struct __sk_buff.data_end (0:16 @ offset 80)
libbpf: prog 'tc_ingress': relo #2: patched insn #3 (LDX/ST/STX) off 80 -> =
80
libbpf: CO-RE relocating [19] struct iphdr: found target candidate
[28387] struct iphdr in [vmlinux]
libbpf: prog 'tc_ingress': relo #3: <byte_off> [19] struct iphdr.ttl
(0:6 @ offset 8)
libbpf: prog 'tc_ingress': relo #3: matching candidate #0 <byte_off>
[28387] struct iphdr.ttl (0:6 @ offset 8)
libbpf: prog 'tc_ingress': relo #3: patched insn #9 (LDX/ST/STX) off 8 -> 8
libbpf: prog 'tc_ingress': relo #4: <byte_off> [19] struct
iphdr.tot_len (0:3 @ offset 2)
libbpf: prog 'tc_ingress': relo #4: matching candidate #0 <byte_off>
[28387] struct iphdr.tot_len (0:3 @ offset 2)
libbpf: prog 'tc_ingress': relo #4: patched insn #10 (LDX/ST/STX) off 2 -> =
2
libbpf: map 'tc_bpf.rodata': created successfully, fd=3D5
..........WATCHDOG: test case xdp_synproxy/tc executes for 10 seconds...
...........................................................................=
...................................WATCHDOG:
test case xdp_synproxy/tc executes for 120 seconds, terminating with
SIGSEGV
Caught signal #11!
Stack trace:
./test_progs(crash_handler+0x28)[0x120594cb8]
linux-vdso.so.1(__vdso_rt_sigreturn+0x0)[0x7ffffeecd084]
/lib64/libc.so.6(read+0x74)[0x7ffff1d296e8]
/lib64/libc.so.6(_IO_file_underflow+0x158)[0x7ffff1cbc664]
/lib64/libc.so.6(_IO_default_xsgetn+0x6c)[0x7ffff1cbeb74]
/lib64/libc.so.6(fread+0xa0)[0x7ffff1cb0318]
./test_progs[0x120589600]
./test_progs(test_xdp_synproxy+0x48)[0x12058a43c]
./test_progs[0x1205953f8]
./test_progs(main+0x6c0)[0x12059747c]
/lib64/libc.so.6(+0x2882c)[0x7ffff1c6c82c]
/lib64/libc.so.6(__libc_start_main+0xa8)[0x7ffff1c6c918]
./test_progs(_start+0x48)[0x12013a0a0]
...........................................................................=
...........................................................................=
......................................................................
