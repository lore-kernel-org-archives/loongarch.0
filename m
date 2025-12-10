Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB9D2DE713
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 03:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336760; cv=none; b=UlftAgnJziW4j7YPs9eHa/BzbHCs4a8Tkyel9Ay8v2lOMWgdAQqMY9mxwvI58mjFSfvLRoBAjg/JehfYg3LN4SkrguTIwvI8a3YilcnkQoUPE5R7n0dLL5i9aHxAXTRi853wc+e7bSVmXah1R4G5yORb6XsrZiJotk+sXTrY6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336760; c=relaxed/simple;
	bh=evoUvJX3mCaBFKhhUFDNjpUyx+VmfYnpIDuiz83BXvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3OvRFi+zwIgw5o8lsP5iZ5aT2nBSWV3ATFjCrBUjL6n2kHgh8FtcnXqSunLnxw0iMsA3JyCVeV/a7qKqIkZDBR8A8GoLNATXm7OfRYcEwTbohexLx8CaV9zt+0zO+2Gte+0f3Qhfnnmw9y5NMNYhcJIClzQjrlZdF5Z149Plrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klNUUdiU; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klNUUdiU"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ed9c19248bso51963911cf.1
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 19:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765336747; x=1765941547; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvcgHHodDEFd6JoOhmN+IKolu8SaPqo8wA5oF6Yaspk=;
        b=klNUUdiUt/GxZC1WLbZxsRjaWQZ0CIQIyyA7kXJSmDHe/JpsMWtVvkXnjEDq0eYHmn
         3DrzYGEhftRn0Bw0nH9O16OSN3pWqtDqgEeUHelDBOZJWkThHe/oayvB8k1NjCEZt2sV
         ocNyn/k5LYX9QECpJfgWqSQDhKZEkaKqwYrUbLC3BDAtk4yAg1ZZh+g61YGqAsnkpxkW
         C7HNYixxKqV+hL9yf0v+NaP5qB4T3y9WtjwrUOc/yK1QI5DLnNc5q8cQd4U4mH3uBVM3
         XdzSu6DD6mIJJJ99hLFEk/TsG61hK/MO+BVJ5iS7Ri/eaBjZA/eOsm5SnTVL1w+U6CfB
         i1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765336747; x=1765941547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DvcgHHodDEFd6JoOhmN+IKolu8SaPqo8wA5oF6Yaspk=;
        b=CTRkggquvRdbidl5ELRK+xNJEy5v+gbSP2zsagDT08Tj6TjLqB6SulLR3thLXRQnGp
         ElXjJ4BSAPeC4NTcMiTJGArS3HGRREDMwOz20QAMVwp5sWcqQDOgKI2Sg540zdcfIjaG
         0hO2WiKu4Bw7eOlcJgyVNhVGCTGlXqUFesSt4D3qPD3qhTta9/iH6B1ylERNFLuftPpE
         nfY/2uS5n+zUU4yocWe0uWgBplOFyxJRRxO/3ue98/5TWXJo+Sjd+x2ZDMFDwvL8bnu5
         eN/aPMQIQ1VoygV9qYWqPYLL/dlAml6R2vGsrvjl1IzWA7usll2lSfGbNzMX0SUFNEMz
         lhOw==
X-Forwarded-Encrypted: i=1; AJvYcCXyzqnW9Oil4Em7Z8RHrTUk/gYibVXXQxNvjcto4jAJk9Rt9ykLQEmlW1vgtvNA5nXcNrkzD/nkZBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZUI4OEd6D/T3ICJg39WWpJ8vC1XHXga+gBq/gFgk+zKGMMMZ5
	Zx5YBMOg1TJwrCshDlx/Fo7POwjlk+jRqHe6M6NSJdTb+ekVrjr/Q674rbrEhpGpYv/b0PAaItE
	Ax/lKvwDKQw5XOO4rWeiyojCuBnxmgx0=
X-Gm-Gg: ASbGnculj0187FVFQQVxnO8fRfywqygydT+Yo6krNxu7AedtuPAyUTI8TWTsQyGV9wq
	jlWjYp+75KDNlA0r7sEmVNpp6zO3PCuHL6XVt4titDSZ1pwdHVBycoj+Z2YS4P6InJaL9sk1wCX
	aPK5WvRvVCsFxmBPHg1H35K1wbgfr4e7stYx7cfM4EAn7FGEQ1ux57NNyfpWPjk6krEv3D4FM1c
	cvZGLXlXGOuzBYycFnZ7SrKrLEj60P8Z4mzvU484MzqWHdQ3W3c9TfqFfBcQw5NExZ5cwU=
X-Google-Smtp-Source: AGHT+IGBnSmzUgYawZmR+V//pPBfELnwqY9lW1v+I/si5q6dRzYyvn2rhIv+AT6zhwiOlcl9i+TimiXcnFd7GV3qYiU=
X-Received: by 2002:ac8:7d4f:0:b0:4ee:278c:bde7 with SMTP id
 d75a77b69052e-4f1b1a69a8cmr15106221cf.23.1765336746807; Tue, 09 Dec 2025
 19:19:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209093405.1309253-1-duanchenghao@kylinos.cn>
In-Reply-To: <20251209093405.1309253-1-duanchenghao@kylinos.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Tue, 9 Dec 2025 19:18:55 -0800
X-Gm-Features: AQt7F2oQPRpKIN1N4cR6kx_h0cVRsq7QdpgOk5f88rMTJyv9px4Be-ii8HcE99w
Message-ID: <CAK3+h2xZEvYdgG=PsmPa+tu-f9zhac+E0s5Um+rPF0cX7uSnuQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Fix the failure issue of the module_attach test case
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, zhangtianyang@loongson.cn, masahiroy@kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 1:34=E2=80=AFAM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
> The following test cases under the tools/testing/selftests/bpf/
> directory have passed the test=EF=BC=9A
>
> ./test_progs -t module_attach
> ./test_progs -t module_fentry_shadow
> ./test_progs -t subprogs
> ./test_progs -t subprogs_extable
> ./test_progs -t tailcalls
> ./test_progs -t struct_ops -d struct_ops_multi_pages
> ./test_progs -t fexit_bpf2bpf
> ./test_progs -t fexit_stress
> ./test_progs -t module_fentry_shadow
> ./test_progs -t fentry_test/fentry
> ./test_progs -t fexit_test/fexit
> ./test_progs -t fentry_fexit
> ./test_progs -t modify_return
> ./test_progs -t fexit_sleep
> ./test_progs -t test_overhead
> ./test_progs -t trampoline_count
>

Tested-by: Vincent Li <vincent.mc.li@gmail.com>

I tested above  and all passed OK, but I could not complete the full
bpf selftests because test_progs core dumped, don't think it is
related to your patch series.

./test_progs --deny=3Dtimer_lockup
...SNIP...
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
test_task_local_data_basic:PASS:pthread_create 0 nsec
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
test_task_local_data_basic:PASS:pthread_create 0 nsec
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
test_task_local_data_basic:PASS:pthread_create 0 nsec
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
test_task_local_data_basic:PASS:pthread_create 0 nsec
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
test_task_local_data_basic:PASS:pthread_create 0 nsec
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
test_task_local_data_basic:PASS:pthread_create 0 nsec
test_task_local_data_basic_thread:FAIL:tld_get_data unexpected error: -12
#444/1   task_local_data/task_local_data_basic:FAIL
test_task_local_data_race:PASS:skel_open_and_load 0 nsec
test_task_local_data_race:PASS:calloc tld_keys 0 nsec
test_task_local_data_race:PASS:TLD_DEFINE_KEY 0 nsec
test_task_local_data_race:FAIL:265
#444/2   task_local_data/task_local_data_race:FAIL
#444     task_local_data:FAIL
Caught signal #11!
Stack trace:
./test_progs(crash_handler+0x28)[0x1205b74ac]
linux-vdso.so.1(__vdso_rt_sigreturn+0x0)[0x7ffffffc1084]
./test_progs[0x1204eb064]
./test_progs(test_task_local_data+0x40)[0x1204eb3f8]
./test_progs[0x1205b7bec]
./test_progs(main+0x6c0)[0x1205b9c70]
/lib64/libc.so.6(+0x2882c)[0x7ffff2f6082c]
/lib64/libc.so.6(__libc_start_main+0xa8)[0x7ffff2f60918]
./test_progs(_start+0x48)[0x12013a0c0]
Segmentation fault (core dumped)

> Chenghao Duan (2):
>   LoongArch: Modify the jump logic of the trampoline
>   LoongArch: BPF: Enable BPF exception fixup for specific ADE subcode
>
>  arch/loongarch/kernel/mcount_dyn.S          | 14 +++++---
>  arch/loongarch/kernel/traps.c               |  7 +++-
>  arch/loongarch/net/bpf_jit.c                | 37 +++++++++++++++------
>  samples/ftrace/ftrace-direct-modify.c       |  8 ++---
>  samples/ftrace/ftrace-direct-multi-modify.c |  8 ++---
>  samples/ftrace/ftrace-direct-multi.c        |  4 +--
>  samples/ftrace/ftrace-direct-too.c          |  4 +--
>  samples/ftrace/ftrace-direct.c              |  4 +--
>  8 files changed, 56 insertions(+), 30 deletions(-)
>
> --
> 2.25.1
>
