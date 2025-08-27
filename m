Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A202777F9
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756307746; cv=none; b=R+52xzUqG9Vv6Qf3sr/HmDn2MNCiygKDBLPys/Q4xQW5Gb1GKlLoOcIjji7ThixDaYcDSJwCGk5MZuIXtZiX+OsnDmOUjhofPGknpwPz+FGiz41Gar6xGJQUX24NhGuNCM9wgA4DMuczK9aemT8DcSnnFWO/4Mu6euCuYRqn3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756307746; c=relaxed/simple;
	bh=PgEPxKHnOwEJrisDshuEuJU9SWQbfG1NSTYMYsAtWZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qD0ydSrz8L9MmIRjc7ZatSLKyC28xDNOJKxPHIoJ35kp3/Mh9YH00Rk6HtdSOUMs342yLJYAOn9LZ2fKoOXvelShSnsBF6nPzWAWxB0w6LrEd6B6whw0mdwzPEl8mOoTZgNp8aNMricOCuxIOQTMTJsKrgKhOCInwXeIh41TeQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ffDFH+a; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ffDFH+a"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24611734e50so164655ad.1
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756307744; x=1756912544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=0ffDFH+a/cBfaTGBIjzf7wnpVLwbTq87QbtXAVpfgEaIGYWsQZZVGiIPtHOclrPLN7
         r6VlNF7HCGfA2XceuH5ArrCxLUIKt7Hdz37xSjwubRGMaHGWYuQDx8Q56LsgQob7MIRj
         TtTzFDAuvwdPeD+hHaB03x5HGHQkb72KTsHAAe2k6qgVLwJClk6eW8LWpoQ6/f4dgx27
         ++Sf1HBWqC/pe+5wlPjSAm0XuyqRLWJ4Sc3D8i1ceoYUa0Uuxx9dMjbZq7fmI+0NsdB9
         tdKdc+TnstfLtbhywQSY3vDGOPGKiZP6qlcsYrntlgLStRHDdLi1p0wwjAyDV4k/zKMS
         n1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307744; x=1756912544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=saiRkSrxRYiLMuTyDzfCxBRVG2t1QegZSZble2iiOl3WZt2NF9N0owNDA97LsFtQ18
         /wIb6lv1MaSZRopu8DIQC50InxA99Yc+wmLDgOQsUKIyi2iCL7rxx0XbgDOgxd/DaFj4
         8lL3z84IdyeX5YIP9GXeNGWdF4GADsW9xnftDo4jQJjHDWi0LgFxpWpwO8hpdDcgNy4A
         CwXvoLENkSZDWYOCCxZz9SeaB0h3sCL0xudOC785Ile2W6FIQdupA3UnlBqJWWJEsr2J
         ogjPfcw1jb2a/U7olOTxXpleEyOnpDluyjvz3cXbwmCLwW8XMZeadEAXBxIbZgFN039L
         J/sw==
X-Forwarded-Encrypted: i=1; AJvYcCWTxzY7tmHwMFjmILIKU3ilmmPN/psxeGsuUSYxMYfZXoWa7ytwGZ9HW6oSxncdFEjxZALguIwWoj8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw4Po7SDyuogxx60fnXcvreLd4kaSKdbXJIUy3xiyyYkOqIfGP
	COCzXHfNKwCrizUUVIxVc8lph9NXbb3tVD4zsEaXZ3M++WAxzEyqoEm/bj2zQrKmg/e1WdUqlcI
	SX2h9BD3SkLvyAW7umBsBMvbeEoRwxWuzB7dRobfS
X-Gm-Gg: ASbGncvEIvXVgQoTffK054UA7mNPj7gjVSge6teKDU8Jz8hFZQRnQ3BGwXPI7w1QqaG
	e6NQbeQm7AJH39YE9ZozbXYJs9cID1Jmxn/two6FmqeGxvdSJIdO8i/Sz5qbL4XTvPP/DqSQYkn
	6qqd/Cfp/SYCgqF31ghsfr5Q0ohNJq8MIZFJ4eAMeqyrBJvXkXeU8j/hTbORjgW0nDQZ4PADVu8
	OhnI0vocCXRfCntdCVkQOajfep3nJPwN3CcTOwFjfs=
X-Google-Smtp-Source: AGHT+IExi0QgPJP/5AblrVahQdACSVklatzIIhzDoM8PROF9H/mRXxhxpv9GhjknP28Wz6ljzGsei6gbP7f3oTXJLVM=
X-Received: by 2002:a17:902:ec87:b0:246:a8ac:1a36 with SMTP id
 d9443c01a7336-2485ba5311amr9397575ad.2.1756307741849; Wed, 27 Aug 2025
 08:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com> <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
 <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
In-Reply-To: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
From: Ian Rogers <irogers@google.com>
Date: Wed, 27 Aug 2025 08:15:29 -0700
X-Gm-Features: Ac12FXwUZ4TrRSXyzgr8XTQRkesJ87wwMtoKHvx086ZRlV4GbvgOq2WSyedNfZ4
Message-ID: <CAP-5=fU0-QDMP-VG3O1qBvJ8uzHHYCQ8j1Vrzy9a0YUk=UMvHw@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
	will@kernel.org, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 1:18=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Aug 26, 2025 at 11:48:48AM -0700, Ian Rogers wrote:
> > On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.=
com> wrote:
> > >
> > > On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > > > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> > > >> It may have been different long ago, but today it seems wrong for =
these
> > > >> drivers to skip counting disabled sibling events in group validati=
on,
> > > >> given that perf_event_enable() could make them schedulable again, =
and
> > > >> thus increase the effective size of the group later. Conversely, i=
f a
> > > >> sibling event is truly dead then it stands to reason that the whol=
e
> > > >> group is dead, so it's not worth going to any special effort to tr=
y to
> > > >> squeeze in a new event that's never going to run anyway. Thus, we =
can
> > > >> simply remove all these checks.
> > > >
> > > > So currently you can do sort of a manual event rotation inside an
> > > > over-sized group and have it work.
> > > >
> > > > I'm not sure if anybody actually does this, but its possible.
> > > >
> > > > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > > > periodically cycle which of the 5 events is off.
> >
> > I'm not sure this is true, I thought this would fail in the
> > perf_event_open when adding the 5th event and there being insufficient
> > counters for the group.
>
> We're talking specifically about cases where the logic in a pmu's
> pmu::event_init() callback doesn't count events in specific states, and
> hence the 5th even doesn't get rejected when it is initialised.
>
> For example, in arch/x86/events/core.c, validate_group() uses
> collect_events(), which has:
>
>         for_each_sibling_event(event, leader) {
>                 if (!is_x86_event(event) || event->state <=3D PERF_EVENT_=
STATE_OFF)
>                         continue;
>
>                 if (collect_event(cpuc, event, max_count, n))
>                         return -EINVAL;
>
>                 n++;
>         }
>
> ... and so where an event's state is <=3D PERF_EVENT_STATE_OFF at init
> time, that event is not counted to see if it fits into HW counters.

Hmm.. Thinking out loud. So it looked like perf with weak groups could
be broken then:
```
$ sudo perf stat -vv -e '{instructions,cycles}:W' true
...
perf_event_attr:
 type                             0 (PERF_TYPE_HARDWARE)
 size                             136
 config                           0x400000001
(cpu_core/PERF_COUNT_HW_INSTRUCTIONS/)
 sample_type                      IDENTIFIER
 read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING|ID|=
GROUP
 disabled                         1
 inherit                          1
 enable_on_exec                   1
------------------------------------------------------------
sys_perf_event_open: pid 3337764  cpu -1  group_fd -1  flags 0x8 =3D 5
------------------------------------------------------------
perf_event_attr:
 type                             0 (PERF_TYPE_HARDWARE)
 size                             136
 config                           0x400000000
(cpu_core/PERF_COUNT_HW_CPU_CYCLES/)
 sample_type                      IDENTIFIER
 read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING|ID|=
GROUP
 inherit                          1
------------------------------------------------------------
sys_perf_event_open: pid 3337764  cpu -1  group_fd 5  flags 0x8 =3D 7
...
```
Note, the group leader (instructions) is disabled because of:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/stat.c?h=3Dperf-tools-next#n761
```
/*
* Disabling all counters initially, they will be enabled
* either manually by us or by kernel via enable_on_exec
* set later.
*/
if (evsel__is_group_leader(evsel)) {
        attr->disabled =3D 1;
```
but the checking of being disabled (PERF_EVENT_STATE_OFF) is only done
on siblings in the code you show above. So yes, you can disable the
group events to allow the perf_event_open to succeed but not on the
leader which is always checked (no PERF_EVENT_STATE_OFF check):
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/arch/x86/events/core.c?h=3Dperf-tools-next#n1204
```
if (is_x86_event(leader)) {
        if (collect_event(cpuc, leader, max_count, n))
                return -EINVAL;
```

Thanks,
Ian
