Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDE7221299
	for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756060013; cv=none; b=TnRqn3DDafvJ6lzXjrYWdRN9gaVjJ3PmnhguKYe2AoTV3ZkZ0WaqGGmlXRVWRL2exQ+5R/ty+ql7zbXUMYmhZ0AtL8t5eyWGe0b28Urt3XrIW7jWPPF/4nWjTlMxbnHekqeoWwtg2bfBe3YH33WdgODVYlBYu8hAN07P/N+e4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756060013; c=relaxed/simple;
	bh=QFEe9kr6hAgm1aLSumExWmXbmZ/gKzqSsucZN9wSA+g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W4mKW9wA1HRMtuHFd/C0GPyr1UM2mgH67QEBK/adxuIPZfRnMLnVXI7LB3FfLUhDZczAtRCz4IcW+IuTm0edVu6g/TVFC/j28L5FfEsO/Gdk+wz+DedKRBBAZDlQHqyN51k4NcTjfwdWDvN8do9Qopr4dCcXsAgy8B1bjZ5aTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZgoMXff; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZgoMXff"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b2cf656e4fso4472281cf.0
        for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756060010; x=1756664810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oYKpS/OVLHtlw1SEhy49/yxULbAc472ZRbOq5epfbUY=;
        b=AZgoMXffxDmrASguL1tPRVKUGkAeR8RoPyMgNg8TKwndEukeuernjrM3+82zraL1Uf
         MoSFB2BhVaQcwSBR9v9MRmdIo+RkHWdEJw/aP5IG1g+BBmu0jYDOw9O01HYodWK5G+eQ
         Cy1Y7d4ep7Jt9sbiNXAxVsp8ookSt3KmURpXUvMh15kkfmF63p3EaLr2hD9djpAyfjjq
         ZvVixN19FA1d4WIlHQ4GMAXkixlLHdCLNsCTEVM+bZtPrAYwdm4pqVrebQBSRP4sY2CU
         lw/LdZveIuHA3JCVj+suEXRlLOOjl+JW536JedfUsxh/y1rqZXvuF8DIduHRhBSdds6B
         utCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756060010; x=1756664810;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYKpS/OVLHtlw1SEhy49/yxULbAc472ZRbOq5epfbUY=;
        b=EgpDWVric0Uei/ywaCYz8YVMqx2xSMLP0ArWzWKIRaf0M7NOy3dn9Y7JOw8HpJlVZU
         xskG+9189nPbyVUMrR4TqDzBVqSCTzdZloHeVYTl9NH2fAaWrrakBFTGzRjuY2mQlegM
         B+WM3P8NE48wXTG0vgbscHyeikepv6V8Caol1QZrGOTY59shgTIcojFzPx7Zi+4MmLrY
         nThXRsfYJluuY6QASfZGDpe8+9io2Wv3K8WBebVu8/HOxnKdToGZ8Fc5pBzSC1EAYmz3
         fOs2SF+DZi5a2+IPzGkMyHMWNDK42+jL4QhMJysPSG+mmLvWUy3LW1zrS/TzRwt7Th3O
         y7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFfLf3AWpk6RCl1kSGRcwIDQU75I4xnyVeqrtSx7Gmpi0JKMIH1KWJwpsD+SgdxmEJHxlmnXfWvYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzLVRo+YVuYSeQ/9/KpRCqlbNQcjHJdfw0TVbLcYfvMC6LTua+
	iG6fhawxXEB7XnNdmBVeJ7i49fpoI+5ZcKWVcwjrKxZpUBAUz0fuFHZIQSwu0/W6mnLEY9vGeu7
	jA4tPTkDEAAu0uNX3blXspbYv1pS3cyc=
X-Gm-Gg: ASbGncu2aVGrYz9TyR7vvw3ulP+KTantiqiqM6FXZrxbOoljA3xDGl5/DvbJboTMMX8
	3e9t66XusDWtenBjHiFK6tUZLSOw7W6lzU9Wq94sRidmMFisJQb1EOnnc2ivRbxig0Jl9UfGLeY
	4XUoKAU30WCTcBje0O7KcyiF+hhqA9CfTlE7sB2PhzEIak3B0M9VwD5YClrB+5s7yFeW0NzPRDl
	VOPe8E=
X-Google-Smtp-Source: AGHT+IFJGyUqt33WNB4UCQgZ0UJ2Z/ZSspgv39DHBNDsrgKA63G9AUd2Zx0kdBgHEpAbjOPge5NFbYWTtoi1my3ETDw=
X-Received: by 2002:a05:622a:1492:b0:4b2:8ac4:f09d with SMTP id
 d75a77b69052e-4b2a0132c57mr167510561cf.39.1756060010522; Sun, 24 Aug 2025
 11:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 24 Aug 2025 11:26:39 -0700
X-Gm-Features: Ac12FXz_2IBrNZzobiwpVlsjzn9xyUXTMXl_5flQTdavloKbOu5OKS0I1fCzbT0
Message-ID: <CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com>
Subject: bpf selftests timer_lockup intermittently locks up kernel
To: bpf <bpf@vger.kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I am running bpf selftests on a Loonarch PC and observed intermittent
kernel lockup by timer_lockup, then I can repeat the lockup just by
running the timer_lockup in while loop every 5 seconds, I could not
find a good x86 machine to test, and I think this might be
architecture independent. I don't have a good way to capture any
kernel log messages for the PC after the kernel hangs, and I had to
power reset the PC.

[root@fedora ~]# uname -a
Linux fedora 6.17.0-rc2+ #20 SMP PREEMPT_DYNAMIC Thu Aug 21 13:08:01
PDT 2025 loongarch64 GNU/Linux

[root@fedora bpf]# while true ; do ./test_progs -t timer_lockup
--watchdog-timeout=120; sleep 5; done
#458     timer_lockup:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

#458     timer_lockup:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
WATCHDOG: test case timer_lockup executes for 10 seconds...
WATCHDOG: test case timer_lockup executes for 120 seconds, terminating
with SIGSEGV
test_timer_lockup:PASS:timer_lockup__open_and_load 0 nsec
test_timer_lockup:PASS:pthread_create thread1 0 nsec
test_timer_lockup:PASS:pthread_create thread2 0 nsec
timer_lockup_thread:PASS:cpu affinity 0 nsec
timer_lockup_thread:PASS:cpu affinity 0 nsec

#458     timer_lockup:FAIL
Caught signal #11!
Stack trace:
./test_progs(crash_handler+0x28)[0x120555b04]
linux-vdso.so.1(__vdso_rt_sigreturn+0x0)[0x7ffffee55084]
/lib64/libc.so.6(+0x7d900)[0x7fffef9b1900]
/lib64/libc.so.6(+0x82cc0)[0x7fffef9b6cc0]
./test_progs(test_timer_lockup+0x3fc)[0x1204bce28]
./test_progs[0x120556244]
./test_progs(main+0x684)[0x120558234]
/lib64/libc.so.6(+0x2882c)[0x7fffef95c82c]
/lib64/libc.so.6(__libc_start_main+0xa8)[0x7fffef95c918]
./test_progs(_start+0x48)[0x12010f2d0]

Thanks,

Vincent
