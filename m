Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F3A29A0
	for <loongarch@lists.linux.dev>; Thu,  6 Jul 2023 22:32:41 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-262ff3a4659so986790a91.0
        for <loongarch@lists.linux.dev>; Thu, 06 Jul 2023 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688682761; x=1691274761;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0I9jMQ+vOGGYxfcUxVDPVdkj3AkI/uMxWS/xRQpRdI=;
        b=JNsFpKffPwcMV5c6xXSLYavf5b5+EGJksAxRUQKoNvWLjgtnQc1hNtwYLg6+EX34qZ
         +vVBTlPPDiVRrcvywH8v7OhdyFYFpiuXYP81AoOqv/Q40DHzh/Ccqmrg7Yc6sEtR2z+M
         hosh01784Q/g87EjyuLRu+nFDjKBvWWfiE3Z3aV1Pp7c6VD6gcmJ3gJwWPrvPel8XXY1
         Mk96wPh70sWOFBN6Eh73gYCVuF/zgktmGmWRCK+TM+s4gsulN1RbLYfNTnGC9WtGzl80
         XO9r8KdThZ1ESa6xuR5HIEUZbWlwcfKMobMVNTGH1GmfbSZcY4YSfELIS/B9INadWhi+
         HLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688682761; x=1691274761;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0I9jMQ+vOGGYxfcUxVDPVdkj3AkI/uMxWS/xRQpRdI=;
        b=Q2w0LWxEQUtGxaaLT7OuIxc5fHPE78H4NpSpvU5J2cuq/VXSOBKEEwGBW0MXrjmDI/
         yv/gwalUtR2IgMLXBCEshge0qUH5gAAwuy43Nffb0i+f0xxSmHgLdCzeFQSs0y7UFnCc
         NLtrbgx4I02UxyR/2IFq2C3mmqgG4264GjXADyGXXWMu5jh9lZzz9/b0dkXcu0eVp0b1
         ZM9xslv+IO10w3tCKY5CwyNP1RwoNqDT+Hfm1PBzpTH0/vLGYYl5iKAE4RMOpDmONIHB
         LmbV/zDV0ZRyLqL4IZrdeArmV3Ec6nsYf6hKuUo66/EW0WQxu/1HZXieqz6/MbHPOoIf
         O5Zw==
X-Gm-Message-State: ABy/qLYq6LNMDAIdas9fo3IVk2pnKcpZKG2z/Jkrwklm0nNs2ArellOO
	q5wccKyfcET/z9Avck1FQRVv7Q==
X-Google-Smtp-Source: APBJJlHrAPqoYnXyVV7hXvAq2LJAfh1k9BS/GZkN4dxKZDzzO/g5a2uMVaTMYVGNMwD2ph3kKrViJA==
X-Received: by 2002:a17:90b:23c7:b0:263:7d57:16e9 with SMTP id md7-20020a17090b23c700b002637d5716e9mr3210557pjb.21.1688682760697;
        Thu, 06 Jul 2023 15:32:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a34c800b00263fd82106asm282941pjf.35.2023.07.06.15.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 15:32:39 -0700 (PDT)
Date: Thu, 06 Jul 2023 15:32:39 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 15:31:47 PDT (-0700)
Subject:     Re: [PATCH v5 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
In-Reply-To: <20230706222027.189117-12-eric.devolder@oracle.com>
CC: linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>, chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
  James.Bottomley@HansenPartnership.com, deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
  glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
  svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
  frederic@kernel.org, akpm@linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>,
  samitolvanen@google.com, juerg.haefliger@canonical.com, Arnd Bergmann <arnd@arndb.de>,
  rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org, sebastian.reichel@collabora.com, rppt@kernel.org,
  kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, masahiroy@kernel.org,
  ndesaulniers@google.com, mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
  xin3.li@intel.com, tj@kernel.org, Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
  bhe@redhat.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, eric.devolder@oracle.com,
  boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: eric.devolder@oracle.com
Message-ID: <mhng-c1c5d9c4-b2c8-45c4-ac0a-084cfecb3833@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 06 Jul 2023 15:20:25 PDT (-0700), eric.devolder@oracle.com wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/riscv/Kconfig | 44 +++++++++++++-------------------------------
>  1 file changed, 13 insertions(+), 31 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49793cf34eb..8a3af850597a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -647,48 +647,30 @@ config RISCV_BOOT_SPINWAIT
>
>  	  If unsure what to do here, say N.
>
> -config KEXEC
> -	bool "Kexec system call"
> -	depends on MMU
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool MMU
> +
> +config ARCH_SELECTS_KEXEC
> +	def_bool y
> +	depends on KEXEC
>  	select HOTPLUG_CPU if SMP
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel. It is like a reboot
> -	  but it is independent of the system firmware. And like a reboot
> -	  you can start any kernel with it, not just Linux.
>
> -	  The name comes from the similarity to the exec system call.
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool 64BIT && MMU
>
> -config KEXEC_FILE
> -	bool "kexec file based systmem call"
> -	depends on 64BIT && MMU
> +config ARCH_SELECTS_KEXEC_FILE
> +	def_bool y
> +	depends on KEXEC_FILE
>  	select HAVE_IMA_KEXEC if IMA
> -	select KEXEC_CORE
>  	select KEXEC_ELF
> -	help
> -	  This is new version of kexec system call. This system call is
> -	  file based and takes file descriptors as system call argument
> -	  for kernel and initramfs as opposed to list of segments as
> -	  accepted by previous system call.
> -
> -	  If you don't know what to do here, say Y.
>
>  config ARCH_HAS_KEXEC_PURGATORY
>  	def_bool KEXEC_FILE
>  	depends on CRYPTO=y
>  	depends on CRYPTO_SHA256=y
>
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec.
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool y
>
>  config COMPAT
>  	bool "Kernel support for 32-bit U-mode"

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
