Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46422E7BB6
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767043678; cv=none; b=WM/MwW66j9rAodU+ucwpPeJhse3YWB6VOgvvLfLz2h/l1XFyPCuWOsC60y7/PclR58D3bL8XhOJUmfGp4pqNn2GgYGgYtD/1M4/IzlU9cx8EbiWG8y5hPnL7Pv7CdlTCaVp65HfImYzd6blzKjWR0kTKtTIRy12pzstiSCnlY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767043678; c=relaxed/simple;
	bh=vyTtBJhgjivjoymORoIjxuKeNshUVTImdJ1rwtSNvHE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ij0Al18cghNDQ7IgwNVFvZVMmAmOLtzvfvOSI0hVdbrfmKavErlNlkCmqmCB52DqA4DlbZ/S/oY0Gnom0+CVepi4MXt2eXIEOWAShIlvnN5dSHdwWgi1f2Hj9OpJ1XUjbPTKVmmGqBZRYSXwJ0P0lEAwe3DO1TtkVrPIDfhpNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtxMxgIg; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtxMxgIg"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8888a16d243so82061996d6.1
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767043676; x=1767648476; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Od3kViHVyQjqkgj70N8iTA8wXUTIl8hcMN95NNLWYqc=;
        b=LtxMxgIg+p0AvNyzOtMhgJn9mzvegI5UCl26kZmEb7FjUDomp7rlw4mODW3B+oPnrc
         jJ4oZyAIUEJLFASIlvcLf8hEwieqaf9y8/8LH+U54JYqtEYeOtxvv7bV59e3U0u2Ue/E
         55UvhJ4F8XbChQg7V+wR/g7CAVF69uj9h5mMzbW2XQu4rPbphEeV6IeV6z0AfQqJeACk
         U4ibKW75hB0yBGdBESlQOdayWOvdeaw6bncMvUdM6U19A6ZdIQlhGfHa5UD4NoYK++ux
         iD3FpaG8+wKnOc+zrM7IqnIPro/0zl0n+NLo8+FjgkEostYJKikF81o6Nj4K8iGzK6xO
         +qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767043676; x=1767648476;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Od3kViHVyQjqkgj70N8iTA8wXUTIl8hcMN95NNLWYqc=;
        b=KvLzi3I/qrYlJvRW4qv3VRURpAJt6I4oYqgOZejZOtsyaf1LHAfeiA1GvRVTqt2gcL
         M+9OJCgfnXzYPLTNUFIrjUrGNzLbmD8rN0Y3DV3tQ4wbElBrEMdtpEDuZtFhyfS1DEOG
         tl63yqG7c0d0Ob4QCM6hufK9ZBhRhAJLwICsrDEelICynsOQh/NcgWjULZAGIoDFLI6s
         dRuYr1ZVXnjguWzyMf/+78aenwmE5M9RMX9akQ2LWfjxqjIsVT5NJTw0V0wb37tSynSR
         TTDA+sqvrCqbffc6bxPTv9Wx8TyCtsI5jDROMsO8D79yxTztqEmy6YwxThORfHJpMAlz
         Nv4A==
X-Forwarded-Encrypted: i=1; AJvYcCWr08bqyOR9qn1bxTSSAgchznhJEcqu4YvhWPdyNCpxHew19lBzlu4DyGIOwqxjWQ6EOFD73mFd6nQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHHQ6c81Q4zDSgi+3M6Q3JoRjf2NNEphw+xFOtwZTXxv72TS5e
	t0NRCNdbN22TLPX92vCFg8r/L0nBQteBZX5B3UkoBLSxoRZYshaayo1UA9LXYRUsOrdmyqts+g5
	hCg6JaGsgWXb+rF67cgu3eWI6bdHQh0c=
X-Gm-Gg: AY/fxX5V5mx4yzkz03Es4VtYayjyppi2FEFEalOSn99qyKBqFWwM7REDS0p/qWtGi6z
	jdD0HD6AEEAnU2Rs4JXqiB0qtAVEl+v9yZ8PktPf+ivkB3N0xcnzBiH/AEUiwQXv+sfOm3pNQt1
	rE8TSTrRL8pYasQRfv3nRv3T0D+cwBDIp3p4SBPlyNM+IPmszbViRitWsI5nFrBWIiWgbGXjktl
	b72IMlLf/azNchvkG7or2vOFOOY/CDCvBbRDfC4NkLZdVT6vJv8VmX5cU5CWLYn6zfnrc4=
X-Google-Smtp-Source: AGHT+IF5/SZj7tOHCLk9mnZZc/wmsC5YlOrjh17yarH9Jx4ieHQ7sqEVGnaAYSZknUJ382WA5vETpQhkH+1+aT3aXKs=
X-Received: by 2002:ad4:5003:0:b0:88a:347c:4117 with SMTP id
 6a1803df08f44-88d85bae7c9mr338983446d6.19.1767043675656; Mon, 29 Dec 2025
 13:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 29 Dec 2025 13:27:43 -0800
X-Gm-Features: AQt7F2oheSMLOpC7GNG9OyN3BOCKe84vHJKDRoEfpWHTjVUgTUohZS9apcUVKW8
Message-ID: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
Subject: x86 bpf selftests report for reference
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Huacai,

I did a manual full bpf selftests on x86 machine, no ns_bpf_qdisc
failure, so indeed like you said, it seems loongarch bpf is
deteriorating. Here is x86 failed bpf test report for reference, there
is no hang up or anything like that during the test.

root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf#test_progs
--json-summary="./bpf_selftests.json"

root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf#cat
bpf_selftests.json | jq . | grep -B4 '"failed": true'  | grep -v
'"message":'
    {
      "name": "bpf_cookie",
      "number": 19,
      "failed": true,
--
        {
          "name": "lsm",
          "number": 9,
          "failed": true
--
    {
      "name": "cgroup1_hierarchy",
      "number": 52,
      "failed": true,
--
        {
          "name": "test_cgroup1_hierarchy",
          "number": 1,
          "failed": true
--
        {
          "name": "test_invalid_level",
          "number": 3,
          "failed": true
--
        {
          "name": "test_invalid_cgid",
          "number": 4,
          "failed": true
--
        {
          "name": "test_invalid_hid",
          "number": 5,
          "failed": true
--
        {
          "name": "test_invalid_cgrp_name",
          "number": 6,
          "failed": true
--
        {
          "name": "test_invalid_cgrp_name2",
          "number": 7,
          "failed": true
--
    {
      "name": "cgroup_tcp_skb",
      "number": 69,
      "failed": true,
--
    {
      "name": "cgroup_xattr",
      "number": 71,
      "failed": true,
--
        {
          "name": "read_cgroupfs_xattr",
          "number": 8,
          "failed": true
--
    {
      "name": "deny_namespace",
      "number": 96,
      "failed": true,
--
        {
          "name": "userns_create_bpf",
          "number": 2,
          "failed": true
--
    {
      "name": "exceptions",
      "number": 104,
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
      "name": "fexit_stress",
      "number": 115,
      "failed": true,
--
    {
      "name": "file_reader",
      "number": 118,
      "failed": true,
--
        {
          "name": "on_open_expect_fault",
          "number": 1,
          "failed": true
--
        {
          "name": "on_open_validate_file_read",
          "number": 2,
          "failed": true
--
    {
      "name": "fs_kfuncs",
      "number": 130,
      "failed": true,
--
        {
          "name": "user_xattr",
          "number": 1,
          "failed": true
--
        {
          "name": "security_bpf_xattr",
          "number": 2,
          "failed": true
--
        {
          "name": "set_remove_xattr",
          "number": 5,
          "failed": true
--
    {
      "name": "get_branch_snapshot",
      "number": 131,
      "failed": true,
--
    {
      "name": "iters",
      "number": 148,
      "failed": true,
--
        {
          "name": "css_task",
          "number": 85,
          "failed": true
--
    {
      "name": "kernel_flag",
      "number": 151,
      "failed": true,
--
    {
      "name": "kfunc_dynptr_param",
      "number": 154,
      "failed": true,
--
        {
          "name": "dynptr_data_null",
          "number": 1,
          "failed": true
--
    {
      "name": "libbpf_get_fd_by_id_opts",
      "number": 168,
      "failed": true,
--
    {
      "name": "lookup_key",
      "number": 185,
      "failed": true,
--
    {
      "name": "lsm_cgroup",
      "number": 187,
      "failed": true,
--
        {
          "name": "functional",
          "number": 1,
          "failed": true
--
    {
      "name": "migrate_reuseport",
      "number": 206,
      "failed": true,
--
        {
          "name": "IPv4 TCP_SYN_RECV     inet_csk_listen_stop",
          "number": 2,
          "failed": true
--
        {
          "name": "IPv4 TCP_NEW_SYN_RECV reqsk_timer_handler",
          "number": 3,
          "failed": true
--
        {
          "name": "IPv4 TCP_NEW_SYN_RECV inet_csk_complete_hashdance",
          "number": 4,
          "failed": true
--
        {
          "name": "IPv6 TCP_SYN_RECV     inet_csk_listen_stop",
          "number": 6,
          "failed": true
--
        {
          "name": "IPv6 TCP_NEW_SYN_RECV reqsk_timer_handler",
          "number": 7,
          "failed": true
--
        {
          "name": "IPv6 TCP_NEW_SYN_RECV inet_csk_complete_hashdance",
          "number": 8,
          "failed": true
--
    {
      "name": "ptr_untrusted",
      "number": 284,
      "failed": true,
--
    {
      "name": "res_spin_lock_failure",
      "number": 369,
      "failed": true,
--
        {
          "name": "res_spin_lock_var_off",
          "number": 12,
          "failed": true
--
    {
      "name": "send_signal",
      "number": 376,
      "failed": true,
--
        {
          "name": "send_signal_perf",
          "number": 2,
          "failed": true
--
        {
          "name": "send_signal_nmi",
          "number": 3,
          "failed": true
--
        {
          "name": "send_signal_perf_thread",
          "number": 5,
          "failed": true
--
        {
          "name": "send_signal_nmi_thread",
          "number": 6,
          "failed": true
--
        {
          "name": "send_signal_perf_remote",
          "number": 8,
          "failed": true
--
        {
          "name": "send_signal_nmi_remote",
          "number": 9,
          "failed": true
--
        {
          "name": "send_signal_perf_thread_remote",
          "number": 11,
          "failed": true
--
        {
          "name": "send_signal_nmi_thread_remote",
          "number": 12,
          "failed": true
--
    {
      "name": "setget_sockopt",
      "number": 378,
      "failed": true,
--
    {
      "name": "sk_assign",
      "number": 381,
      "failed": true,
--
    {
      "name": "sockmap_basic",
      "number": 399,
      "failed": true,
--
        {
          "name": "sockmap vsock delete on close",
          "number": 3,
          "failed": true
--
        {
          "name": "sockmap skb_verdict vsock poll",
          "number": 29,
          "failed": true
--
    {
      "name": "sockmap_listen",
      "number": 401,
      "failed": true,
--
        {
          "name": "sockmap IPv4 TCP test_reuseport_select_listening",
          "number": 33,
          "failed": true
--
        {
          "name": "sockmap IPv6 TCP test_reuseport_select_listening",
          "number": 71,
          "failed": true
--
        {
          "name": "sockhash IPv4 TCP test_reuseport_select_listening",
          "number": 109,
          "failed": true
--
        {
          "name": "sockhash IPv6 TCP test_reuseport_select_listening",
          "number": 147,
          "failed": true
--
    {
      "name": "sockmap_redir",
      "number": 402,
      "failed": true,
--
    {
      "name": "stream_success",
      "number": 422,
      "failed": true,
--
        {
          "name": "stream_cond_break",
          "number": 2,
          "failed": true
--
        {
          "name": "stream_deadlock",
          "number": 3,
          "failed": true
--
    {
      "name": "tcpbpf_user",
      "number": 460,
      "failed": true,
--
    {
      "name": "test_bpffs",
      "number": 467,
      "failed": true,
--
    {
      "name": "test_bprm_opts",
      "number": 469,
      "failed": true,
--
    {
      "name": "test_ima",
      "number": 472,
      "failed": true,
--
    {
      "name": "test_local_storage",
      "number": 473,
      "failed": true,
--
    {
      "name": "test_lsm",
      "number": 474,
      "failed": true,
--
        {
          "name": "lsm_basic",
          "number": 1,
          "failed": true
--
    {
      "name": "token",
      "number": 485,
      "failed": true,
--
        {
          "name": "obj_priv_prog",
          "number": 5,
          "failed": true
--
    {
      "name": "unpriv_bpf_disabled",
      "number": 498,
      "failed": true,
--
    {
      "name": "verifier_private_stack",
      "number": 576,
      "failed": true,
--
        {
          "name": "Private stack, exception in main prog",
          "number": 5,
          "failed": true
--
        {
          "name": "Private stack, exception in subprog",
          "number": 6,
          "failed": true
--
    {
      "name": "verif_scale_pyperf600",
      "number": 625,
      "failed": true,
--
    {
      "name": "verify_pkcs7_sig",
      "number": 642,
      "failed": true,
--
        {
          "name": "pkcs7_sig_from_map",
          "number": 1,
          "failed": true
--
        {
          "name": "pkcs7_sig_fsverity",
          "number": 2,
          "failed": true
