Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82224FB9C3
	for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567872; cv=pass; b=JsbJr/rPqPfmluGIG5eU6TJj3wu2HdDBkA90XosEX55nJzIwSAXM/7cQp7akhSMK5emZbJMDXETmd/pxGHfRAJvgyfjYxJkw9ck7g4vPt4uxaeSvkCMRrYECUM8yZDTKR0tUf/xRs0TG77xge2UCDqvm0dgSp60dQNj0MAFBg7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567872; c=relaxed/simple;
	bh=LA3xiUoTtcTDq1neJ7+//Pj3snFWoGiyGhE7D0VJj04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYC++KrZSYYSyEKv3QdzR+bS10lyP5xwDLtCbi/anx8GU/nPzL9LecO5EXdVwvQc1GtUBidzR/E9m1n8QOSpbH5Lqf9KXGnvL+BbAZFAJwKC7UyfSMJGlGm72iX938hHrLReFIJBLTnlpmF/hthgOd58XftWHzNJw1I1FML9ooE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=HQMbRKHb; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="HQMbRKHb"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso145359666b.0
        for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 07:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789567869; cv=none;
        d=google.com; s=arc-20260327;
        b=mMBt81AFpOl/n9wGo2j92tXihEoIeKsDh/bx1jcGBksE8nG2kBURXkez71mDVA6gEv
         STqh78VYkfLCEsZVA5iE7UV7XfgSL7C54ta3FbM7X0jvPJ7yZ1knStrkrpcneaJcjVNV
         MqpqrdjEbzNPcjNyhFBuqooV2DWjAOcUZj3HaMqvq1vzWMDK4OQ6KofwUGRYzf6pjMpp
         HLKr+LjdJN8yOCEeIJMUcJ6eKvrgarjmZseneAsbIWE9VBuQ6YiRq8Iq8/0Lks1uPOVr
         F+FzbHAteAYaWhEGRqloiSgJDqtWLgPGgKk3jXYc7DMrtsdUamD5DjqYg69hie0DG9Xm
         L97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qwvc5XrhyeUeFxqjOZggVlBmG3xKi93jOSCSLGG5TiI=;
        fh=SDrIrk7j1LZnPT7EKIGQFg8jYv9fj1IOa637/4nVsjs=;
        b=k2/dhoxchJCJypAxGkEi2gWhgJHRwsog4t+170ulCLRN7bX+BDQxveuXX3f4x3hvu/
         shKLbU9BEO2UC4+TuICQh/KK7QrYkeExOgxEuK/Ql9qeiNjIywo0ChZiTW9Z/A8stY6V
         doVM8GVZmukFP9uqRkavhyZ+MGAesRt68tJOdYyAWnNBFJcTFnb8LaYvO72l4J2y2cYX
         equwEFUv5KPh+8W3/ejgFUd/uEIDowgkpcbFj07eSYLK6afL9NsDWet4WrlAL0IA/NNl
         eWXmgudaRYmIg43E2iBKr7brglecJG2zlr/9iNOsQrGkdGAaRjhhAqdkUcsuM9yep9eB
         Qlyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1789567869; x=1790172669; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qwvc5XrhyeUeFxqjOZggVlBmG3xKi93jOSCSLGG5TiI=;
        b=HQMbRKHb4u/hXOSYWgAMfZtoVkcb5lK15G59xxCHdXMSARvRIB1r9oBhpRB6LMmNAg
         3L5dfd8j77Ts3pQ6hNae/aaPNsM06x6fO608RPD0F2F87TpBZYl8tFKFF8goyxEMX7NT
         Rsz+rVY8CkdDkWmEdq82JLSprQkei0yUScRaKSlLfkt9JiRf5EgXyTAT1x1ppo60aT7F
         LIBg7EaK7ezikDjupBT0pO3kqzhxC305vpiCNYSljlB0Su65e4smyY/48eGq37Okb09k
         xppP5mUOfMdnVk7cKy1NDt0ePDvsOjndQV485AOF3LpPj7hGYM0gdddCJIrMmMLGwAqE
         lCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567869; x=1790172669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwvc5XrhyeUeFxqjOZggVlBmG3xKi93jOSCSLGG5TiI=;
        b=V+1rjGOF741kZqbwnsyWV6yx6yJq/lPlxF47DMYPMpUP+IBjFdQBylYprWAQkcetjg
         C0oPajOtikB1fkKNcqGzvUoSUZOSjt8Pfzc4xaCqgonMGrDcEL4Obj/9TdnPEmIqagVK
         jWXwNoCDfs/P9cvkxbtBJODGGNGu/AWTqzVNMVh4YAWnaCDp49zLQIaGKzAmpSd50kx9
         p84wdEHrvzLpIJ0yOv46MLd1Gk/RH2khCUpDUB01kWocMLWo9Ohrt99YzRVICA7spsl8
         mAigY1noZdgFxGnwEbE9HMFPRMmzhKv0Ikr5EJL9LU29QuP3EnKMOge87Vn9+xEVLzG7
         hirw==
X-Forwarded-Encrypted: i=1; AKwUvBxjt4bPU4fO+Aip6vTCmw3QzUbxJLe5OFtETk4Yasd3T5ivC/HU2TZjP2Od33GATOT8Irp8vyxi+NE=@lists.linux.dev
X-Gm-Message-State: AFuF++lrLk0Wb5lpDRUk9wRhz064NsdvUWMrEWNHlXxyeXueHucg+oHv
	cLd0iziZOHePcekn2LLlWIv6EbPDqXpgd8OiV1CrsZG+48ZM/DBZhKQUMsOF9z0BtN52KkrTDzW
	o6rkx/QLs2DHODBWwEg/MbsQziJFjvKm+XkIVefsuFQ==
X-Gm-Gg: AYBFou3ZcUAwDQLa/7BaVvfDyLVh+ZCyUDsXLCoN6jrSFuT1g+HYDVboPQ+tm5+Bb1f
	Vcl4rB7SMspBOVYO5Cy92XU6apj/t9NkTurmyQdjJwT1XsFmgt5EBKo3YuzzbzOedxyuKnNhuak
	RKOBeZIe7GsveVE2vtQE9aC2ZfBSP45CgnaeejGCbKnjY5X5W18E2r7ANn3+nq53XSaGRJewtpq
	LWiaatHncQEjvlmpup4LLMdQeRqS00F8icBthOViDxe+ynCloY/XaCNuFkZ9aRDQ946ziGHMc5S
	L5dIbrOV4pZ6vjpZS+22or34JvHSdVfdKHqAZ8+bmcdDtlVBrmCPVhyFsel1ViUlzuJRQylY3lB
	AJ5+Q+7NSTG2gbw==
X-Received: by 2002:a17:907:9288:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c29e53929acmr177597166b.30.1789567868530; Wed, 16 Sep 2026
 07:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908075106.5039-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260908075106.5039-1-yangtiezhu@loongson.cn>
From: WANG Rui <r@hev.cc>
Date: Wed, 16 Sep 2026 22:10:56 +0800
X-Gm-Features: AcwNN1WczV6HT3XYgTAvRP3yZnrxwcIslwm8cJuSynBDLqCF6EsVmEYx4U-rPro
Message-ID: <CAHirt9gQAJ3p1cdbpJGnNcG=MDYvC-iW4euUHcwyOEwJ_aPgjA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] LoongArch: Fix perf hardware breakpoints
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

On Tue, Sep 8, 2026 at 3:58=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> v2: Use single variable "need_sigtrap" to send SIGTRAP in do_watch().
>
> This series addresses severe functional degradations in standard
> perf_event usage, including initialization failures and one-shot
> triggering limitations.
>
> All fixes have been verified with user-space reproducers on real
> hardware and align with the LoongArch Reference Manual.
>
> Here is a user-space reproducer demonstrating that standard perf
> hardware breakpoints can now reliably monitor 10,000 hits without
> a single event leakage or subsystem lockup.
>
> (1) Test program (perf-hw-breakpoint.c):
>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <sys/ioctl.h>
>   #include <sys/syscall.h>
>   #include <unistd.h>
>   #include <linux/hw_breakpoint.h>
>   #include <linux/perf_event.h>
>
>   #ifndef noinline
>   #define noinline __attribute__((noinline))
>   #endif
>
>   static noinline void test_function(const uint8_t *data)
>   {
>         asm volatile("" :: "r"(data[0]) : "memory");
>   }
>
>   int main(void)
>   {
>         int fd, ret, i;
>         size_t count;
>         uint8_t data[] =3D "TEST DATA";
>         struct perf_event_attr attr =3D {0};
>
>         attr.type =3D PERF_TYPE_BREAKPOINT;
>         attr.size =3D sizeof(struct perf_event_attr);
>         attr.bp_type =3D HW_BREAKPOINT_RW;
>         attr.bp_addr =3D (uintptr_t)data;
>         attr.bp_len  =3D HW_BREAKPOINT_LEN_1;
>         attr.exclude_kernel =3D 1;
>         attr.exclude_hv =3D 1;
>         attr.disabled =3D 1;
>
>         fd =3D syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
>         ioctl(fd, PERF_EVENT_IOC_RESET, 0);
>         ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
>
>         for (i =3D 0; i < 10000; i++)
>                 test_function(data);
>
>         ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
>         read(fd, &count, sizeof(size_t));
>
>         printf("perf count =3D %zu\n", count);
>
>         close(fd);
>         return 0;
>   }
>
> (2) Test steps:
>
>   $ gcc perf-hw-breakpoint.c -o perf-hw-breakpoint
>   $ ./perf-hw-breakpoint
>
> (3) Test results:
>
> Without this series:
>
>   perf count =3D 0
>
> With this series:
>
>   perf count =3D 10000
>
> Tiezhu Yang (6):
>   LoongArch: Fix bitmask corruption in update_bp_registers()
>   LoongArch: Remove redundant call in update_bp_registers()
>   LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
>   LoongArch: Only send SIGTRAP signal if necessary in do_watch()
>   LoongArch: Fix perf hardware breakpoint failure via installation
>   LoongArch: Fix one-shot limitation for perf hardware breakpoints

Thanks! Without these patches, perf-event tests always fail; with
them, they fail intermittently.

Reproduce with:
1. git clone https://github.com/jimblandy/perf-event && cd perf-event
2. cargo test -r # or --test breakpoint

Best,
Rui

>
>  arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
>  arch/loongarch/include/asm/loongarch.h     |  7 +++-
>  arch/loongarch/kernel/hw_breakpoint.c      | 43 ++++++++++++++++------
>  arch/loongarch/kernel/traps.c              | 12 +++---
>  4 files changed, 46 insertions(+), 20 deletions(-)
>
> --
> 2.42.0
>
>
