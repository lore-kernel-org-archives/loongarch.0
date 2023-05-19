Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74930125AE
	for <loongarch@lists.linux.dev>; Fri, 19 May 2023 14:13:56 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50d897af77bso789444a12.1
        for <loongarch@lists.linux.dev>; Fri, 19 May 2023 07:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684505634; x=1687097634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtyjmo3U27wuRhuxdBoN4szAZEtqJIsshyVfilBgAD0=;
        b=YyCX5E40sNpYjFnhFMFtoZ2931fK1XM4tGHsxcwpR9W9Ku5hyvGyq5hhhl+XAh6Ope
         FYQe7WET0rx5zanVVwp2oEhY7kw8sF5lSarZGbDHVNyLQ5y0La/CdpesyAZZeWXKWcER
         8RdrIiMW3zmrRraKcRCRSZcNkmO6j8u7yWJs7P7URi3iSNf+NADDOQ07CUQt5aZLP0vG
         qnQ/KovFvJT0DL5cPJoph8jOJOaGfA4rh8OLkAgTHM4F5+I9NtZE/bClIQSGu6QRkgxy
         FLHzwZpvsxDqPYeVoqRcTwBGSEbuFNS1P4TpFKCk+8e3Z/05uQ8zFHDa/e4L1S3w/j7G
         54bg==
X-Gm-Message-State: AC+VfDwF4ahhES6sxqGVlL7ztVxC7Z+unwf07An0+2uodoVN60Izv7SJ
	FSkzVLEHzmLcIX4eFL5p/wX2WN2S7xZlFq0AnaY=
X-Google-Smtp-Source: ACHHUZ68+/i2ffEZTXg6tj3QMitnfwpUc6ZolPA0xIlso352d5CtlPMyVKVablcnpHf+LCxLGPtLwAjOXXkDYlCuYhQ=
X-Received: by 2002:a17:906:729e:b0:96f:6590:cbdb with SMTP id
 b30-20020a170906729e00b0096f6590cbdbmr1995862ejl.6.1684505634451; Fri, 19 May
 2023 07:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230519102058.581557770@infradead.org> <20230519102716.045980863@infradead.org>
In-Reply-To: <20230519102716.045980863@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 19 May 2023 16:13:41 +0200
Message-ID: <CAJZ5v0hAyF8WK+jbWh6FZvmjfr0nxLg-phYTqFAyaUA5GJU4hQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] cpuidle: Use local_clock_noinstr()
To: Peter Zijlstra <peterz@infradead.org>
Cc: bigeasy@linutronix.de, mark.rutland@arm.com, maz@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com, 
	boris.ostrovsky@oracle.com, daniel.lezcano@linaro.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	rafael@kernel.org, longman@redhat.com, boqun.feng@gmail.com, pmladek@suse.com, 
	senozhatsky@chromium.org, rostedt@goodmis.org, john.ogness@linutronix.de, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	jstultz@google.com, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, kvm@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 12:33=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> With the introduction of local_clock_noinstr(), local_clock() itself
> is no longer marked noinstr, use the correct function.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/cpuidle/cpuidle.c    |    8 ++++----
>  drivers/cpuidle/poll_state.c |    4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@ -145,7 +145,7 @@ static noinstr void enter_s2idle_proper(
>
>         instrumentation_begin();
>
> -       time_start =3D ns_to_ktime(local_clock());
> +       time_start =3D ns_to_ktime(local_clock_noinstr());
>
>         tick_freeze();
>         /*
> @@ -169,7 +169,7 @@ static noinstr void enter_s2idle_proper(
>         tick_unfreeze();
>         start_critical_timings();
>
> -       time_end =3D ns_to_ktime(local_clock());
> +       time_end =3D ns_to_ktime(local_clock_noinstr());
>
>         dev->states_usage[index].s2idle_time +=3D ktime_us_delta(time_end=
, time_start);
>         dev->states_usage[index].s2idle_usage++;
> @@ -243,7 +243,7 @@ noinstr int cpuidle_enter_state(struct c
>         sched_idle_set_state(target_state);
>
>         trace_cpu_idle(index, dev->cpu);
> -       time_start =3D ns_to_ktime(local_clock());
> +       time_start =3D ns_to_ktime(local_clock_noinstr());
>
>         stop_critical_timings();
>         if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE)) {
> @@ -276,7 +276,7 @@ noinstr int cpuidle_enter_state(struct c
>         start_critical_timings();
>
>         sched_clock_idle_wakeup_event();
> -       time_end =3D ns_to_ktime(local_clock());
> +       time_end =3D ns_to_ktime(local_clock_noinstr());
>         trace_cpu_idle(PWR_EVENT_EXIT, dev->cpu);
>
>         /* The cpu is no longer idle or about to enter idle. */
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -15,7 +15,7 @@ static int __cpuidle poll_idle(struct cp
>  {
>         u64 time_start;
>
> -       time_start =3D local_clock();
> +       time_start =3D local_clock_noinstr();
>
>         dev->poll_time_limit =3D false;
>
> @@ -32,7 +32,7 @@ static int __cpuidle poll_idle(struct cp
>                                 continue;
>
>                         loop_count =3D 0;
> -                       if (local_clock() - time_start > limit) {
> +                       if (local_clock_noinstr() - time_start > limit) {
>                                 dev->poll_time_limit =3D true;
>                                 break;
>                         }
>
>
